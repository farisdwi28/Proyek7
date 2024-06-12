import 'dart:convert';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  static Map<String, String> _getHeaders({bool includeToken = true}) {
    final headers = {'Content-type': 'application/json'};
    if (includeToken) {
      final token = TLocalStorage().readData<String>('token');
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  static Future<dynamic> get(String endpoint, {bool includeToken = true}) async {
    final response = await http.get(
      Uri.parse(endpoint),
      headers: _getHeaders(includeToken: includeToken),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> post(String endpoint, dynamic data, {bool includeToken = true}) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: _getHeaders(includeToken: includeToken),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> put(String url, Map<String, dynamic> body, {bool includeToken = false}) async {
    final response = await http.put(
      Uri.parse(url),
      headers: _getHeaders(includeToken: includeToken),
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> delete(String endpoint, {bool includeToken = true}) async {
    final response = await http.delete(
      Uri.parse(endpoint),
      headers: _getHeaders(includeToken: includeToken),
    );
    return _handleResponse(response);
  }

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      // Handle both Map and List types
      if (decoded is Map<String, dynamic> || decoded is List) {
        return decoded;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
