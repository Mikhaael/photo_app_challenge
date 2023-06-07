import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'mocks/mock_api_pg.dart';


void main() {
  group('Pagination', () {
    test('fetchNextPage should load more photos', () async {
      final galleryData = PhotoGalleryData();
      final mockApiClient = MockApiClient();

      galleryData.apiClient = mockApiClient;

      expect(galleryData.photos.isEmpty, equals(true));

      final initialPhotoCount = galleryData.photos.length;

      await galleryData.fetchNextPage();

      expect(galleryData.photos.isNotEmpty, equals(true));
      expect(galleryData.photos.length > initialPhotoCount, equals(true));
    });

    test('fetchNextPage should handle reaching the end of available pages', () async {
      final galleryData = PhotoGalleryData();
      final mockApiClient = MockApiClient();

      galleryData.apiClient = mockApiClient;

      await galleryData.fetchNextPage();
      await galleryData.fetchNextPage();

      final initialPhotoCount = galleryData.photos.length;

      await galleryData.fetchNextPage();

      expect(galleryData.photos.length == initialPhotoCount, equals(true));
    });
  });
}


