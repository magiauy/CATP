import 'package:flutter/material.dart';
import 'package:testflutter/utils/logger.dart';

class SOSController with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Set loading state
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Make emergency call (placeholder - would need url_launcher package)
  Future<void> makeEmergencyCall(String phoneNumber) async {
    try {
      setLoading(true);
      clearError();

      // Simulate emergency call action
      await Future.delayed(const Duration(seconds: 1));

      // In a real app, this would open the phone dialer
      // For now, we'll just show a message
      AppLogger.info('Emergency call to: $phoneNumber');
    } catch (e) {
      setError('Có lỗi xảy ra khi thực hiện cuộc gọi: $e');
    } finally {
      setLoading(false);
    }
  }

  // Open SMS (placeholder - would need url_launcher package)
  Future<void> sendSMS(String phoneNumber, String message) async {
    try {
      setLoading(true);
      clearError();

      // Simulate SMS action
      await Future.delayed(const Duration(seconds: 1));

      // In a real app, this would open the SMS app
      AppLogger.info('SMS to: $phoneNumber, Message: $message');
    } catch (e) {
      setError('Có lỗi xảy ra khi gửi tin nhắn: $e');
    } finally {
      setLoading(false);
    }
  }

  // Handle service card tap
  void handleServiceCardTap(BuildContext context, String serviceName) {
    // Show dialog or navigate to specific service
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(serviceName),
        content: Text('Bạn có muốn liên hệ với dịch vụ $serviceName?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle specific service action
              _handleSpecificService(serviceName);
            },
            child: const Text('Liên hệ'),
          ),
        ],
      ),
    );
  }

  // Handle specific service actions
  void _handleSpecificService(String serviceName) {
    switch (serviceName) {
      case 'Bảo vệ trẻ em':
        makeEmergencyCall('111');
        break;
      case 'An toàn công cộng':
        makeEmergencyCall('113');
        break;
      case 'Chống ma túy':
        makeEmergencyCall('114');
        break;
      case 'Quan hệ công chúng':
        makeEmergencyCall('115');
        break;
      case 'Tư vấn tâm lý':
        makeEmergencyCall('116');
        break;
      default:
        makeEmergencyCall('113');
        break;
    }
  }

  // Get emergency contacts
  List<Map<String, dynamic>> getEmergencyContacts() {
    return [
      {
        'name': 'Cảnh sát',
        'number': '113',
        'icon': Icons.local_police,
        'color': Colors.blue,
      },
      {
        'name': 'Cứu hỏa',
        'number': '114',
        'icon': Icons.local_fire_department,
        'color': Colors.red,
      },
      {
        'name': 'Cấp cứu',
        'number': '115',
        'icon': Icons.local_hospital,
        'color': Colors.green,
      },
      {
        'name': 'Tổng đài khẩn cấp',
        'number': '911',
        'icon': Icons.emergency,
        'color': Colors.orange,
      },
    ];
  }
}
