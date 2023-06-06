import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_app_challenge/src/features/address/presentation/screens/photo_details.dart';
import 'package:provider/provider.dart';

import '../../data/models/photo_model.dart';
import '../provider/provider.dart';

class PhotoGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PhotoProvider>(context, listen: false);
    model.fetchPhotos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Galler'),
      ),
      body: Consumer<PhotoProvider>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (model.hasError) {
            return const Center(child: Text('Failed to fetch photos'));
          } else {
            return GridView.builder(
              itemCount: model.photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
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
                );
              },
            );
          }
        },
      ),
    );
  }
}