// import 'package:flutter_test/flutter_test.dart';
// import 'package:dio/dio.dart';
// import 'package:photo_app_challenge/src/features/address/presentation/provider/provider.dart';
//
// import '../src/features/address/data/models/photo_model.dart';
//
// void main() {
//   group('PhotoGalleryModel', () {
//     test('fetchPhotos should fetch and load photos', () async {
//       final model = PhotoProvider();
//       final dio = Dio();
//
//       final response = await dio.get(model.apiUrl);
//
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = response.data;
//
//         final fetchedPhotos = responseData.map((data) {
//           return Photo.fromJson(data);
//         }).toList();
//
//         await model.fetchPhotos();
//
//         expect(model.photos, fetchedPhotos);
//         expect(model.isLoading, false);
//         expect(model.page, 2);
//         expect(model.hasError, false);
//       }
//     });
//
//     test('fetchPhotos should handle errors', () async {
//       final model = PhotoProvider();
//       model.apiUrl = 'invalid_api_url';
//
//       await model.fetchPhotos();
//
//       expect(model.photos, isEmpty);
//       expect(model.isLoading, false);
//       expect(model.page, 1);
//       expect(model.hasError, true);
//     });
//
//     test('fetchPhotos should load more photos on pagination', () async {
//       final model = PhotoProvider();
//       final dio = Dio();
//
//       final response = await dio.get(model.apiUrl);
//
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = response.data;
//
//         final fetchedPhotos = responseData.map((data) {
//           return Photo.fromJson(data);
//         }).toList();
//
//         await model.fetchPhotos();
//
//         final initialPhotos = model.photos;
//
//         expect(model.page, 2);
//         expect(model.hasError, false);
//
//         await model.fetchPhotos();
//
//         expect(
//             model.photos.length, initialPhotos.length + fetchedPhotos.length);
//         expect(model.page, 3);
//         expect(model.hasError, false);
//       }
//     });
//   });
// }
