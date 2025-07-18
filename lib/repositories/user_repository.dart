import '../models/user.dart';
import '../services/interfaces/api_service.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<List<User>> getUsers() async {
    try {
      final response = await _apiService.get('/users');
      final usersData = response['data'] as List;
      return usersData.map((userData) => User.fromJson(userData)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  Future<User> getUserById(String id) async {
    try {
      final response = await _apiService.get('/users/$id');
      return User.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  Future<User> createUser(User user) async {
    try {
      final response = await _apiService.post('/users', user.toJson());
      return User.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<User> updateUser(User user) async {
    try {
      final response = await _apiService.put('/users/${user.id}', user.toJson());
      return User.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _apiService.delete('/users/$id');
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
