import 'package:flutter/material.dart';

import '../../../../utils/designs/photo_theme.dart';
import '../../data/models/photo_model.dart';

class PhotoDetailsPage extends StatelessWidget {
  final Photo photo;

  PhotoDetailsPage(this.photo);

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
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.title,
                    style: PhotoTheme.lightTextTheme.bodyLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By ${photo.authorName}',
                      style: PhotoTheme.lightTextTheme.bodyLarge,
                  ),
                  SizedBox(height: 8),
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
