import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';

class MyHttpClient {
  Future<Map<String, dynamic>> get(String url) async {
    final response = await html.HttpRequest.getString(url);
    return _decodeResponse(response);
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, String> body) async {
    final response = await html.HttpRequest.postFormData(url, body);
    return _decodeResponse(response.responseText ?? '');
  }

  Map<String, dynamic> _decodeResponse(String response) {
    try {
      return jsonDecode(response);
    } catch (e) {
      debugPrint('Error decoding response: $e');
      throw Exception('Error decoding response: $e');
    }
  }
}
