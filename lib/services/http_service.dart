import 'dart:convert';
import 'package:http/http.dart' as http;
import 'interfaces/api_service.dart';
import '../config/app_config.dart';

class HttpService implements ApiService {
  final String _baseUrl = AppConfig.apiBaseUrl;

  @override
  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data: ${response.statusCode}');
    }
  }

  @override
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update data: ${response.statusCode}');
    }
  }

  @override
  Future<void> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete data: ${response.statusCode}');
    }
  }
}
