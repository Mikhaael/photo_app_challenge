import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/photo_model.dart';
import 'package:http/http.dart' as http;



class PhotoGalleryModel extends ChangeNotifier {
  final ApiClient apiClient;

  List<Photo> photos = [];
  bool isLoading = true;
  bool hasError = false;

  PhotoGalleryModel({ApiClient? apiClient}) : apiClient = apiClient ?? ApiClient();
  Future<void> fetchPhotos() async {
    try {
      photos = await apiClient.fetchPhotos();
      hasError = false;
    } catch (e) {
      hasError = true;
    }
    isLoading = false;
    notifyListeners();
  }
}

class ApiClient {
  final String apiUrl;

  ApiClient({this.apiUrl = 'https://api.example.com'});

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$apiUrl/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Photo> photos = jsonList.map((json) => Photo.fromJson(json)).toList();
      return photos;
    } else {
      throw Exception('Failed to fetch photos. Status code: ${response.statusCode}');
    }
  }
}