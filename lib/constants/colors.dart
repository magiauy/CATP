import 'package:flutter/material.dart';

class AppColors {
  // Primary colors - Xanh lá là màu chủ đạo của app
  static const Color primary = Color(0xFF0F9E38); // Màu xanh lá chính
  static const Color primaryLight = Color(0xFF81C784); // Màu xanh lá nhạt
  static const Color primaryDark = Color(0xFF2E7D32); // Màu xanh lá đậm

  // Secondary colors - Xanh dương cho các action
  static const Color secondary = Color(0xFF2196F3); // Màu xanh dương cho button
  static const Color secondaryLight = Color(0xFF64B5F6);
  static const Color secondaryDark = Color(0xFF1976D2);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF424242);

  // Status colors - Màu thông báo trạng thái
  static const Color success = Color(
    0xFF4CAF50,
  ); // Giữ nguyên màu success là xanh lá
  static const Color error = Color(0xFFF44336); // Đỏ cho lỗi
  static const Color warning = Color(0xFFFF9800); // Cam cho cảnh báo
  static const Color info = Color(0xFF2196F3); // Xanh dương cho thông tin

  // Background & Surface colors
  static const Color background = Color(0xFFF5F5F5); // Màu nền chung
  static const Color surface = Color(0xFFFFFFFF); // Màu nền cho card, dialog
  static const Color surfaceVariant = Color(
    0xFFF3F3F3,
  ); // Màu nền cho input field

  // Text colors - Màu chữ
  static const Color textPrimary = Color(0xFF333333); // Màu chữ chính
  static const Color textSecondary = Color(0xFF666666); // Màu chữ phụ
  static const Color textHint = Color(0xFF999999); // Màu placeholder
  static const Color textDisabled = Color(0xFFBDBDBD);

  static var redSOS = Color(0xFFE04759); // Màu chữ SOS
}
