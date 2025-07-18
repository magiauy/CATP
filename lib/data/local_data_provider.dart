// Local data provider
import 'dart:convert';
import 'package:flutter/services.dart';

class LocalDataProvider {
  static Future<Map<String, dynamic>> loadMockData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/mock_data.json');
      return json.decode(jsonString);
    } catch (e) {
      throw Exception('Failed to load mock data: $e');
    }
  }

  static Future<List<dynamic>> loadUsers() async {
    final data = await loadMockData();
    return data['users'] ?? [];
  }

  static Future<List<dynamic>> loadCategories() async {
    final data = await loadMockData();
    return data['categories'] ?? [];
  }

  static Future<Map<String, dynamic>> loadSettings() async {
    final data = await loadMockData();
    return data['settings'] ?? {};
  }
}
