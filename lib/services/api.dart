import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {

  static Future<Map<String, dynamic>> getData(String tag, Uri url) async {
    try {
      final response = await http.get(url);
      final statusCode = response.statusCode;
      final body = response.bodyBytes;
      return {'statusCode': statusCode, 'body': body};
    } catch (e) {
      return {'statusCode': 500, 'body': null};
    }
  }

  static Future<Map<String, dynamic>> postData(String tag, Uri url, Map<String, dynamic> data) async {
    try {
      final response = await http.post(url, body: json.encode(data), headers: {'Content-Type': 'application/json'});
      final statusCode = response.statusCode;
      final body = response.bodyBytes;
      return {'statusCode': statusCode, 'body': body};
    } catch (e) {
      return {'statusCode': 500, 'body': null};
    }
  }
}