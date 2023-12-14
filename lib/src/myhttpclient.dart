import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';

class MyHttpClient {
  Future<Map<String, dynamic>> post(
      String url, Map<String, String> body) async {
    final response = await html.HttpRequest.postFormData(url, body);
    return _decodeResponse(response);
  }

  Map<String, dynamic> _decodeResponse(html.HttpRequest response) {
    try {
      if (response is html.HttpRequest) {
        return jsonDecode(response.responseText ?? '');
      } else {
        throw Exception('Invalid response type: ${response.runtimeType}');
      }
    } catch (e) {
      debugPrint('Error decoding response: $e');
      throw Exception('Error decoding response: $e');
    }
  }
}
