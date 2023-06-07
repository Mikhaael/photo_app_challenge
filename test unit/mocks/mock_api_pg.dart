import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:photo_app_challenge/src/features/address/data/models/photo_model.dart';


class ApiClient {
  final String apiUrl = 'https://api.unsplash.com/photos?page=1&per_page=10&client_id=y9e1_8pgcqRoWYgMCd4OsfNBEV9Uh9YrsBcFHxdJAU8';

  Future<List<Photo>> fetchPhotos({int page = 1}) async {
    final response = await http.get(Uri.parse('$apiUrl/photos?page=$page'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonPhotos = json.decode(response.body);
      final List<Photo> photos = jsonPhotos.map((json) => Photo.fromJson(json)).toList();

      return photos;
    } else {
      throw Exception('Failed to fetch photos. Status code: ${response.statusCode}');
    }
  }
}

class PhotoGalleryData {
  ApiClient _apiClient = ApiClient();
  List<Photo> photos = [];
  int _currentPage = 1;

  ApiClient get apiClient => _apiClient;

  set apiClient(ApiClient client) {
    _apiClient = client;
  }

  Future<void> fetchNextPage() async {
    try {
      final List<Photo> nextPagePhotos = await _apiClient.fetchPhotos(page: _currentPage);

      _currentPage++;

      photos.addAll(nextPagePhotos);
    } catch (e) {
      print('Error fetching next page: $e');
    }
  }
}

class MockApiClient extends ApiClient {
  @override
  Future<List<Photo>> fetchPhotos({int page = 1}) async {
    if (page == 2) {
      throw Exception('Failed to fetch photos. Status code: 401');
    }
    final jsonPhotos = [
      {'id': '1', 'title': 'Photo 1'},
      {'id': '2', 'title': 'Photo 2'},
    ];

    return jsonPhotos.map((json) => Photo.fromJson(json)).toList();
  }
}