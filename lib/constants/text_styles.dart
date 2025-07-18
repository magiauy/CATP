import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle appTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    color: AppColors.textSecondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
  static const linkText = TextStyle(fontSize: 16, color: AppColors.primary);
  static const screenTitle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  static const nativeText = TextStyle(
    fontSize: 16,
    color: AppColors.secondary,
    fontWeight: FontWeight.w600,
  );
  static const placeholderText = TextStyle(
    fontSize: 16,
    color: AppColors.textHint,
  );
  static const TextStyle ageTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static const TextStyle sosText = TextStyle(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
}
