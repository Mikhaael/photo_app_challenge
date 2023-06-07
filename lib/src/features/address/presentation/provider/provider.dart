import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../../api_key.dart';
import '../../data/models/photo_model.dart';

class PhotoProvider extends ChangeNotifier {
  final PhotoProviderData _data;

  PhotoProvider(this._data);

  List<Photo> get photos => _data.photos;

  bool get isLoading => _data.isLoading;

  bool get hasError => _data.hasError;

  bool get hasMorePages => _data.hasMorePages;

  int get page => _data.page;

  Future<void> fetchPhotos() async {
    await _data.fetchPhotos();
    notifyListeners();
  }

  Future<void> loadMorePhotos() async {
    await _data.loadMorePhotos();
    notifyListeners();
  }
}

class PhotoProviderData {
  final String apiUrl =
      'https://api.unsplash.com/photos?page=1&per_page=10&client_id=y9e1_8pgcqRoWYgMCd4OsfNBEV9Uh9YrsBcFHxdJAU8';
  final int perPage = 10;
  final Dio _dio;

  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  bool _hasMorePages = true;
  bool get hasMorePages => _hasMorePages;

  int _page = 1;
  int get page => _page;

  PhotoProviderData(this._dio);

  Future<void> fetchPhotos() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      final response = await _dio.get('$apiUrl&page=$_page');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        List<Photo> fetchedPhotos = responseData.map((data) {
          return Photo.fromJson(data);
        }).toList();
        _photos = fetchedPhotos;
        _isLoading = false;
        _hasError = false;
        _page++;
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    }
    _isLoading = false;
  }

  Future<void> loadMorePhotos() async {
    if (_isLoading || !_hasMorePages) return;

    _isLoading = true;
    try {
      final response = await _dio.get('$apiUrl&page=$_page');
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        List<Photo> fetchedPhotos = responseData.map((data) {
          return Photo.fromJson(data);
        }).toList();
        _photos.addAll(fetchedPhotos);
        _isLoading = false;
        _hasError = false;
        _page++;
        if (fetchedPhotos.length < perPage) {
          _hasMorePages = false;
        }
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    }
    _isLoading = false;
  }
}