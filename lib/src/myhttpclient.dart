import 'dart:convert';
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHttpClient {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get(String url) async {
    final response = await _dio.get(url);
    return _decodeResponse(response.data);
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, String> body) async {
    final response = await _dio.post(url, data: body);
    return _decodeResponse(response.data);
  }

  Map<String, dynamic> _decodeResponse(dynamic response) {
    try {
      return jsonDecode(response ?? '');
    } catch (e) {
      debugPrint('Error decoding response: $e');
      throw Exception('Error decoding response: $e');
    }
  }
}
