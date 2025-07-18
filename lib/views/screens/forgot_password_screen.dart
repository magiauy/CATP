import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/forgot_password_controller.dart';
import '../../constants/constants.dart';
import '../../widgets/custom_alert.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Consumer<ForgotPasswordController>(
          builder: (context, controller, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Status bar space
                  const SizedBox(height: 20),

                  // Logo và tiêu đề
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          ImagesConstants.logo,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        AppStrings.appName,
                        style: AppTextStyles.appTitle,
                      ),
                    ],
                  ),

                  // Form quên mật khẩu
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Back button
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: AppColors.textPrimary,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // Tiêu đề
                                  Center(
                                    child: Column(
                                      children: [
                                        const Text(
                                          AppStrings.forgotPasswordTitle,
                                          style: AppTextStyles.screenTitle,
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // Email field
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: AppStrings.emailHint,
                                      hintStyle: AppTextStyles.placeholderText,
                                      filled: true,
                                      fillColor: AppColors.background,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 16,
                                          ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppStrings.emptyEmail;
                                      }
                                      if (!RegexConstants.isValidEmail(value)) {
                                        return AppStrings.invalidEmail;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) =>
                                        controller.setEmail(value),
                                  ),

                                  const SizedBox(height: 40),

                                  // Send reset link button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: controller.isLoading
                                          ? null
                                          : () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                await controller
                                                    .sendResetLink();
                                                if (mounted &&
                                                    !controller.isLoading) {
                                                  // Show success message using custom alert
                                                  AlertHelper.showSuccess(
                                                    context,
                                                    message: AppStrings
                                                        .forgotPasswordSubtitle,
                                                  );
                                                }
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.secondary,
                                        foregroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: controller.isLoading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Text(
                                              AppStrings.sendResetLink,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ),
                                  ),

                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
