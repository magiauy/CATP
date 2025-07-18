import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {
  String _title = 'Welcome';
  bool _isLoading = false;

  String get title => _title;
  bool get isLoading => _isLoading;

  void setTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> loadData() async {
    setLoading(true);
    try {
      // Giả lập tải dữ liệu
      await Future.delayed(const Duration(seconds: 2));
      setTitle('Data Loaded');
    } catch (e) {
      setTitle('Error loading data');
    } finally {
      setLoading(false);
    }
  }
}
