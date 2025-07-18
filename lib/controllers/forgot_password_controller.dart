import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  String _email = '';
  bool _isLoading = false;

  String get email => _email;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  Future<void> sendResetLink() async {
    if (_email.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Here you would typically make an API call to send reset link
      // await AuthService.sendPasswordResetEmail(_email);

      print('Password reset link sent to: $_email');
    } catch (e) {
      print('Error sending password reset link: $e');
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _email = '';
    _isLoading = false;
    notifyListeners();
  }
}
