import 'package:customized_google_map/model/error_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'google_api_service.dart';

class ApiManager {
  final GoogleApiService _googleApiService = GoogleApiService();

  Future<dynamic> getPlaces(String url, BuildContext context) async {
    try {
      final response = await _googleApiService.get(url, context);
      return response;
    } on DioError catch (error) {
      throw ErrorModel.fromJson(error.response?.data);
    }
  }
}