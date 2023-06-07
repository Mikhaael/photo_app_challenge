import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_app_challenge/src/features/address/presentation/screens/photo_details.dart';
import 'package:provider/provider.dart';

import '../../../../utils/designs/photo_theme.dart';
import '../../data/models/photo_model.dart';
import '../provider/provider.dart';

class PhotoGalleryPage extends StatefulWidget {
  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final model = Provider.of<PhotoProvider>(context, listen: false);
    model.fetchPhotos();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        model.loadMorePhotos();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Photo Gallery',
            style: PhotoTheme.lightTextTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Consumer<PhotoProvider>(
        builder: (context, model, child) {
          if (model.isLoading && model.page == 1) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError && model.page == 1) {
            return Center(child: Text('Failed to fetch photos'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              controller: _scrollController,
              itemCount: model.photos.length + 1,
              itemBuilder: (context, index) {
                if (index < model.photos.length) {
                  final photo = model.photos[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoDetailsPage(photo),
                        ),
                      );
                    },
                    child: Hero(
                      tag: photo.id,
                      child: GridTile(
                        footer: GridTileBar(
                          backgroundColor: Colors.black54,
                          title: Text(
                            photo.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        child: Image.network(
                          photo.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                } else if (model.hasMorePages) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox();
                }
              },
            );
          }
        },
      ),
    );
  }
}
