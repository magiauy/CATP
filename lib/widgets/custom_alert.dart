import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/string.dart';

enum AlertType { success, error, warning, confirm }

class CustomAlert extends StatelessWidget {
  final AlertType type;
  final String title;
  final String message;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const CustomAlert({
    Key? key,
    required this.type,
    required this.title,
    required this.message,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getBackgroundColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(_getIcon(), color: _getBackgroundColor(), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
      content: Text(
        message,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
          height: 1.4,
        ),
      ),
      actions: _buildActions(context),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case AlertType.success:
        return AppColors.success;
      case AlertType.error:
        return AppColors.error;
      case AlertType.warning:
        return AppColors.warning;
      case AlertType.confirm:
        return AppColors.info;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case AlertType.success:
        return Icons.check_circle;
      case AlertType.error:
        return Icons.error;
      case AlertType.warning:
        return Icons.warning;
      case AlertType.confirm:
        return Icons.help;
    }
  }

  List<Widget> _buildActions(BuildContext context) {
    switch (type) {
      case AlertType.success:
      case AlertType.error:
      case AlertType.warning:
        return [
          TextButton(
            onPressed: onConfirm ?? () => Navigator.of(context).pop(),
            child: Text(
              confirmText ?? AppStrings.ok,
              style: TextStyle(
                color: _getBackgroundColor(),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ];
      case AlertType.confirm:
        return [
          TextButton(
            onPressed: onCancel ?? () => Navigator.of(context).pop(false),
            child: Text(
              cancelText ?? AppStrings.cancel,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onConfirm ?? () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: _getBackgroundColor(),
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              confirmText ?? AppStrings.ok,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ];
    }
  }
}

// Helper class để hiển thị alert dễ dàng
class AlertHelper {
  static Future<void> showSuccess(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(
          type: AlertType.success,
          title: title ?? AppStrings.success,
          message: message,
          onConfirm: onConfirm,
        );
      },
    );
  }

  static Future<void> showError(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(
          type: AlertType.error,
          title: title ?? AppStrings.error,
          message: message,
          onConfirm: onConfirm,
        );
      },
    );
  }

  static Future<void> showWarning(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(
          type: AlertType.warning,
          title: title ?? AppStrings.warning,
          message: message,
          onConfirm: onConfirm,
        );
      },
    );
  }

  static Future<bool?> showConfirm(
    BuildContext context, {
    required String message,
    String? title,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(
          type: AlertType.confirm,
          title: title ?? AppStrings.confirm,
          message: message,
          confirmText: confirmText,
          cancelText: cancelText,
          onConfirm: onConfirm,
          onCancel: onCancel,
        );
      },
    );
  }
}

// Toast notification widget
class CustomToast extends StatelessWidget {
  final AlertType type;
  final String message;
  final Duration duration;

  const CustomToast({
    Key? key,
    required this.type,
    required this.message,
    this.duration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: _getBackgroundColor().withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _getBackgroundColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(_getIcon(), color: _getBackgroundColor(), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case AlertType.success:
        return AppColors.success;
      case AlertType.error:
        return AppColors.error;
      case AlertType.warning:
        return AppColors.warning;
      case AlertType.confirm:
        return AppColors.info;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case AlertType.success:
        return Icons.check_circle;
      case AlertType.error:
        return Icons.error;
      case AlertType.warning:
        return Icons.warning;
      case AlertType.confirm:
        return Icons.info;
    }
  }
}

// Toast helper class
class ToastHelper {
  static void showSuccess(BuildContext context, String message) {
    _showToast(context, AlertType.success, message);
  }

  static void showError(BuildContext context, String message) {
    _showToast(context, AlertType.error, message);
  }

  static void showWarning(BuildContext context, String message) {
    _showToast(context, AlertType.warning, message);
  }

  static void showInfo(BuildContext context, String message) {
    _showToast(context, AlertType.confirm, message);
  }

  static void _showToast(BuildContext context, AlertType type, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 0,
        right: 0,
        child: CustomToast(type: type, message: message),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto remove after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
