import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../data/models/photo_model.dart';

class PhotoProvider extends ChangeNotifier {
  final String apiUrl =
      'https://api.unsplash.com/photos?page=1&per_page=10&client_id=y9e1_8pgcqRoWYgMCd4OsfNBEV9Uh9YrsBcFHxdJAU8';

  final Dio _dio = Dio();

  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  int _page = 1;
  int get page => _page;

  Future<void> fetchPhotos() async {
    if (_isLoading) return;

    _isLoading = true;

    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;

        List<Photo> fetchedPhotos = responseData.map((data) {
          return Photo.fromJson(data);
        }).toList();

        _photos.addAll(fetchedPhotos);
        _isLoading = false;
        _page++;
        _hasError = false;
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    }

    notifyListeners();
  }
}

