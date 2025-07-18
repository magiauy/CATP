import 'package:flutter/material.dart';

class AgeSelectionController with ChangeNotifier {
  String? _selectedAgeGroup;

  String? get selectedAgeGroup => _selectedAgeGroup;

  void selectAgeGroup(String ageGroup) {
    _selectedAgeGroup = ageGroup;
    notifyListeners();
  }

  void navigateToNext(BuildContext context) {
    if (_selectedAgeGroup != null) {
      // Navigate to next screen based on age group
      if (_selectedAgeGroup == '12-18') {
        // Navigate to teen-specific screen
        Navigator.pushNamed(context, '/teen-home');
      } else if (_selectedAgeGroup == '18-30') {
        // Navigate to adult-specific screen
        Navigator.pushNamed(context, '/adult-home');
      }
    }
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToSOS(BuildContext context) {
    Navigator.pushNamed(context, '/sos');
  }
}
