import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _rememberMe = false;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  bool get rememberMe => _rememberMe;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void setRememberMe(bool remember) {
    _rememberMe = remember;
    notifyListeners();
  }

  Future<void> login() async {
    setLoading(true);
    try {
      // Simulate login process
      await Future.delayed(const Duration(seconds: 2));
      // TODO: Implement actual login logic
      // If login successful, navigate to home
      // This will be handled in the UI layer
    } catch (e) {
      // Handle error
    } finally {
      setLoading(false);
    }
  }

  Future<void> loginWithGoogle() async {
    setLoading(true);
    try {
      // Simulate Google login
      await Future.delayed(const Duration(seconds: 1));
      // TODO: Implement Google login
    } catch (e) {
      // Handle error
    } finally {
      setLoading(false);
    }
  }

  Future<void> loginWithFacebook() async {
    setLoading(true);
    try {
      // Simulate Facebook login
      await Future.delayed(const Duration(seconds: 1));
      // TODO: Implement Facebook login
    } catch (e) {
      // Handle error
    } finally {
      setLoading(false);
    }
  }

  void forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot-password');
  }

  void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }
}
