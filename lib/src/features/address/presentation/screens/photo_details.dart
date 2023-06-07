import 'package:flutter/material.dart';
import 'package:photo_app_challenge/src/utils/designs/dimens.dart';

import '../../../../utils/designs/photo_theme.dart';
import '../../data/models/photo_model.dart';

const double space = 18;

class PhotoDetailsPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailsPage(this.photo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Photo Details',
            style: PhotoTheme.lightTextTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Hero(
        tag: photo.id,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                photo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.title,
                    style: PhotoTheme.lightTextTheme.bodyLarge,
                  ),
                  vSpace(space / 2),
                  Text(
                    'By ${photo.authorName}',
                      style: PhotoTheme.lightTextTheme.bodyLarge,
                  ),
                  vSpace(space / 2),
                  Text(
                    photo.description,
                    style: PhotoTheme.lightTextTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
