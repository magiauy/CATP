import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  String _fullName = '';
  String _email = '';
  String _dateOfBirth = '';
  String _phoneNumber = '';
  String _password = '';
  bool _isLoading = false;
  bool _obscurePassword = true;

  String get fullName => _fullName;
  String get email => _email;
  String get dateOfBirth => _dateOfBirth;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;

  void setFullName(String name) {
    _fullName = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setDateOfBirth(String date) {
    _dateOfBirth = date;
    notifyListeners();
  }

  void setPhoneNumber(String phone) {
    _phoneNumber = phone;
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

  Future<void> register() async {
    setLoading(true);
    try {
      // Simulate registration process
      await Future.delayed(const Duration(seconds: 2));
      // TODO: Implement actual registration logic
    } catch (e) {
      // Handle error
    } finally {
      setLoading(false);
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dateOfBirth =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      notifyListeners();
    }
  }
}
