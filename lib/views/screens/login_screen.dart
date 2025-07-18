import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/login_controller.dart';
import '../../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Consumer<LoginController>(
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

                  const SizedBox(height: 40),

                  // Form đăng nhập
                  Expanded(
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                // Tiêu đề và link đăng ký
                                Center(
                                  child: Column(
                                    children: [
                                      const Text(
                                        AppStrings.login,
                                        style: AppTextStyles.screenTitle,
                                      ),

                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            AppStrings.notHaveAccount,
                                            style: TextStyle(
                                              color: AppColors.textSecondary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => controller
                                                .navigateToRegister(context),
                                            child: const Text(
                                              AppStrings.register,
                                              style: AppTextStyles.nativeText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 32),

                                // Email field
                                const Text(
                                  AppStrings.email,
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
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      controller.setEmail(value),
                                ),

                                const SizedBox(height: 20),

                                // Password field
                                const Text(
                                  'Mật khẩu',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: controller.obscurePassword,
                                  decoration: InputDecoration(
                                    hintText: AppStrings.passwordHint,
                                    hintStyle: AppTextStyles.placeholderText,
                                    filled: true,
                                    fillColor: AppColors.background,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: const Color(0xFF999999),
                                      ),
                                      onPressed: () =>
                                          controller.togglePasswordVisibility(),
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      controller.setPassword(value),
                                ),

                                const SizedBox(height: 16),

                                // Remember me và forgot password
                                Row(
                                  children: [
                                    Checkbox(
                                      value: controller.rememberMe,
                                      onChanged: (value) => controller
                                          .setRememberMe(value ?? false),
                                      activeColor: AppColors.secondary,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    const Text(
                                      'Lưu đăng nhập',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          controller.forgotPassword(context),
                                      child: const Text(
                                        'Quên mật khẩu ?',
                                        style: AppTextStyles.nativeText,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 32),

                                // Login button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: controller.isLoading
                                        ? null
                                        : () async {
                                            await controller.login();
                                            if (mounted &&
                                                !controller.isLoading) {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                '/',
                                              );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondary,
                                      foregroundColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                                            'Đăng nhập',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Or divider
                                const Center(
                                  child: Text(
                                    'Hoặc',
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Google login button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: OutlinedButton(
                                    onPressed: controller.isLoading
                                        ? null
                                        : () => controller.loginWithGoogle(),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImagesConstants.googleIcon,
                                          width: 20,
                                          height: 20,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const Icon(
                                                  Icons.g_mobiledata,
                                                  size: 20,
                                                  color: Color(0xFF4285F4),
                                                );
                                              },
                                        ),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Đăng nhập với Google',
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Facebook login button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: OutlinedButton(
                                    onPressed: controller.isLoading
                                        ? null
                                        : () => controller.loginWithFacebook(),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImagesConstants.facebookIcon,
                                          width: 20,
                                          height: 20,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const Icon(
                                                  Icons.facebook,
                                                  size: 20,
                                                  color: Color(0xFF1877F2),
                                                );
                                              },
                                        ),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Đăng nhập Facebook',
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
