import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../widgets/custom_alert.dart';

class AlertDemoScreen extends StatelessWidget {
  const AlertDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Alert Demo'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Alert Dialogs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Success Alert
            ElevatedButton.icon(
              onPressed: () {
                AlertHelper.showSuccess(
                  context,
                  message: 'Thao tác đã được thực hiện thành công!',
                );
              },
              icon: const Icon(Icons.check_circle),
              label: const Text('Success Alert'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Error Alert
            ElevatedButton.icon(
              onPressed: () {
                AlertHelper.showError(
                  context,
                  message:
                      'Đã xảy ra lỗi trong quá trình xử lý. Vui lòng thử lại!',
                );
              },
              icon: const Icon(Icons.error),
              label: const Text('Error Alert'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Warning Alert
            ElevatedButton.icon(
              onPressed: () {
                AlertHelper.showWarning(
                  context,
                  message:
                      'Cảnh báo: Hành động này có thể ảnh hưởng đến dữ liệu của bạn.',
                );
              },
              icon: const Icon(Icons.warning),
              label: const Text('Warning Alert'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warning,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Confirm Alert
            ElevatedButton.icon(
              onPressed: () async {
                final result = await AlertHelper.showConfirm(
                  context,
                  message: 'Bạn có chắc chắn muốn xóa mục này không?',
                  confirmText: 'Xóa',
                  cancelText: 'Hủy',
                );

                if (result == true) {
                  ToastHelper.showSuccess(context, 'Đã xóa thành công!');
                } else {
                  ToastHelper.showInfo(context, 'Đã hủy thao tác');
                }
              },
              icon: const Icon(Icons.help),
              label: const Text('Confirm Alert'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.info,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              'Toast Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Success Toast
            OutlinedButton.icon(
              onPressed: () {
                ToastHelper.showSuccess(context, 'Thành công!');
              },
              icon: const Icon(Icons.check_circle),
              label: const Text('Success Toast'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.success,
                side: const BorderSide(color: AppColors.success),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Error Toast
            OutlinedButton.icon(
              onPressed: () {
                ToastHelper.showError(context, 'Có lỗi xảy ra!');
              },
              icon: const Icon(Icons.error),
              label: const Text('Error Toast'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Warning Toast
            OutlinedButton.icon(
              onPressed: () {
                ToastHelper.showWarning(context, 'Cảnh báo!');
              },
              icon: const Icon(Icons.warning),
              label: const Text('Warning Toast'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.warning,
                side: const BorderSide(color: AppColors.warning),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 12),

            // Info Toast
            OutlinedButton.icon(
              onPressed: () {
                ToastHelper.showInfo(context, 'Thông tin quan trọng!');
              },
              icon: const Icon(Icons.info),
              label: const Text('Info Toast'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.info,
                side: const BorderSide(color: AppColors.info),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
