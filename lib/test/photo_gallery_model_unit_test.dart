import 'package:flutter_test/flutter_test.dart';
import '../src/features/address/data/datasources/mock_api_pgm.dart';


void main() {
  group('PhotoGalleryModel', () {
    late PhotoGalleryModel model;

    setUp(() {
      model = PhotoGalleryModel();
    });

    test('Initial state should be loading', () {
      expect(model.isLoading, true);
      expect(model.photos, isEmpty);
    });

    test('Fetch photos success', () async {
      await model.fetchPhotos();

      expect(model.isLoading, false);
      expect(model.hasError, false);
      expect(model.photos.isNotEmpty, true);
    });
  });
}
