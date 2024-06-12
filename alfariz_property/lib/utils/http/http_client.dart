import 'dart:convert';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  static Map<String, String> _getHeaders({bool includeToken = true}) {
    final headers = {
      'Content-type': 'application/json',
    };
    if (includeToken) {
      final token = TLocalStorage().readData<String>('token');
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  static Future<Map<String, dynamic>> get(String endpoint,
      {bool includeToken = true}) async {
    final response = await http.get(
      Uri.parse(endpoint),
      headers: _getHeaders(includeToken: includeToken),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(String endpoint, dynamic data,
      {bool includeToken = true}) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: _getHeaders(includeToken: includeToken),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body,
      {bool includeToken = false}) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (includeToken) {
      final token = await TLocalStorage().readData<String>('token');
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> delete(String endpoint,
      {bool includeToken = true}) async {
    final response = await http.delete(
      Uri.parse(endpoint),
      headers: _getHeaders(includeToken: includeToken),
    );
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      return json
          .decode(response.body); // Tambahkan ini untuk menangani respons 400
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
