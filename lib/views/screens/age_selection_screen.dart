import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/age_selection_controller.dart';
import '../../constants/constants.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Consumer<AgeSelectionController>(
          builder: (context, controller, child) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                right: 30.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  // Status bar space
                  const SizedBox(height: 20),

                  // SOS Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.navigateToSOS(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.error.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              AppStrings.sos,
                              style: AppTextStyles.sosText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Title
                  const Text(
                    AppStrings.ageSelectionTitle,
                    style: AppTextStyles.ageTitle,
                    textAlign: TextAlign.center,
                  ),

                  // Age Group Options
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(
                          children: [
                            // Age Group 1: 12-18
                            GestureDetector(
                              onTapDown: (_) {
                                controller.selectAgeGroup('12-18');
                              },
                              onTapUp: (_) {
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    if (!context.mounted) return;
                                    controller.navigateToNext(context);
                                  },
                                );
                              },
                              onTapCancel: () {
                                controller.selectAgeGroup('');
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.only(bottom: 20),
                                transform: Matrix4.identity()
                                  ..scale(
                                    controller.selectedAgeGroup == '12-18'
                                        ? 1.05
                                        : controller.selectedAgeGroup == '18-30'
                                        ? 0.95
                                        : 1.0,
                                  ),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withValues(
                                    alpha:
                                        controller.selectedAgeGroup == '12-18'
                                        ? 1.0
                                        : controller.selectedAgeGroup == '18-30'
                                        ? 0.6
                                        : 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withValues(
                                        alpha:
                                            controller.selectedAgeGroup ==
                                                '12-18'
                                            ? 0.25
                                            : controller.selectedAgeGroup ==
                                                  '18-30'
                                            ? 0.05
                                            : 0.1,
                                      ),
                                      blurRadius:
                                          controller.selectedAgeGroup == '12-18'
                                          ? 20
                                          : controller.selectedAgeGroup ==
                                                '18-30'
                                          ? 5
                                          : 10,
                                      offset: Offset(
                                        0,
                                        controller.selectedAgeGroup == '12-18'
                                            ? 12
                                            : controller.selectedAgeGroup ==
                                                  '18-30'
                                            ? 2
                                            : 5,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Icon placeholder (you can replace with actual icon)
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withValues(
                                          alpha:
                                              controller.selectedAgeGroup ==
                                                  '12-18'
                                              ? 0.15
                                              : controller.selectedAgeGroup ==
                                                    '18-30'
                                              ? 0.05
                                              : 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: AnimatedOpacity(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        opacity:
                                            controller.selectedAgeGroup ==
                                                '12-18'
                                            ? 1.0
                                            : controller.selectedAgeGroup ==
                                                  '18-30'
                                            ? 0.5
                                            : 1.0,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          child: Image.asset(
                                            ImagesConstants.teenIcon,
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return const Icon(
                                                    Icons.person,
                                                    color: AppColors.primary,
                                                    size: 30,
                                                  );
                                                },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedDefaultTextStyle(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          style: TextStyle(
                                            color: AppColors.textPrimary.withValues(
                                              alpha:
                                                  controller.selectedAgeGroup ==
                                                      '12-18'
                                                  ? 1.0
                                                  : controller
                                                            .selectedAgeGroup ==
                                                        '18-30'
                                                  ? 0.6
                                                  : 1.0,
                                            ),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          child: Text(AppStrings.ageGroup1),
                                        ),
                                        const SizedBox(height: 4),
                                        AnimatedDefaultTextStyle(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          style: TextStyle(
                                            color: AppColors.textSecondary.withValues(
                                              alpha:
                                                  controller.selectedAgeGroup ==
                                                      '12-18'
                                                  ? 1.0
                                                  : controller
                                                            .selectedAgeGroup ==
                                                        '18-30'
                                                  ? 0.6
                                                  : 1.0,
                                            ),
                                            fontSize: 14,
                                          ),
                                          child: Text(
                                            AppStrings.ageGroup1Description,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Age Group 2: 18-30
                            GestureDetector(
                              onTapDown: (_) {
                                controller.selectAgeGroup('18-30');
                              },
                              onTapUp: (_) {
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    if (!context.mounted) return;
                                    controller.navigateToNext(context);
                                  },
                                );
                              },
                              onTapCancel: () {
                                controller.selectAgeGroup('');
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                transform: Matrix4.identity()
                                  ..scale(
                                    controller.selectedAgeGroup == '18-30'
                                        ? 1.05
                                        : controller.selectedAgeGroup == '12-18'
                                        ? 0.95
                                        : 1.0,
                                  ),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withValues(
                                    alpha:
                                        controller.selectedAgeGroup == '18-30'
                                        ? 1.0
                                        : controller.selectedAgeGroup == '12-18'
                                        ? 0.6
                                        : 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withValues(
                                        alpha:
                                            controller.selectedAgeGroup ==
                                                '18-30'
                                            ? 0.25
                                            : controller.selectedAgeGroup ==
                                                  '12-18'
                                            ? 0.05
                                            : 0.1,
                                      ),
                                      blurRadius:
                                          controller.selectedAgeGroup == '18-30'
                                          ? 20
                                          : controller.selectedAgeGroup ==
                                                '12-18'
                                          ? 5
                                          : 10,
                                      offset: Offset(
                                        0,
                                        controller.selectedAgeGroup == '18-30'
                                            ? 12
                                            : controller.selectedAgeGroup ==
                                                  '12-18'
                                            ? 2
                                            : 5,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Icon placeholder (you can replace with actual icon)
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: AppColors.secondary.withValues(
                                          alpha:
                                              controller.selectedAgeGroup ==
                                                  '18-30'
                                              ? 0.15
                                              : controller.selectedAgeGroup ==
                                                    '12-18'
                                              ? 0.05
                                              : 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: AnimatedOpacity(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        opacity:
                                            controller.selectedAgeGroup ==
                                                '18-30'
                                            ? 1.0
                                            : controller.selectedAgeGroup ==
                                                  '12-18'
                                            ? 0.5
                                            : 1.0,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          child: Image.asset(
                                            ImagesConstants.adultIcon,
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return const Icon(
                                                    Icons.person,
                                                    color: AppColors.secondary,
                                                    size: 30,
                                                  );
                                                },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedDefaultTextStyle(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          style: TextStyle(
                                            color: AppColors.textPrimary.withValues(
                                              alpha:
                                                  controller.selectedAgeGroup ==
                                                      '18-30'
                                                  ? 1.0
                                                  : controller
                                                            .selectedAgeGroup ==
                                                        '12-18'
                                                  ? 0.6
                                                  : 1.0,
                                            ),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          child: Text(AppStrings.ageGroup2),
                                        ),
                                        const SizedBox(height: 4),
                                        AnimatedDefaultTextStyle(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          style: TextStyle(
                                            color: AppColors.textSecondary.withValues(
                                              alpha:
                                                  controller.selectedAgeGroup ==
                                                      '18-30'
                                                  ? 1.0
                                                  : controller
                                                            .selectedAgeGroup ==
                                                        '12-18'
                                                  ? 0.6
                                                  : 1.0,
                                            ),
                                            fontSize: 14,
                                          ),
                                          child: Text(
                                            AppStrings.ageGroup2Description,
                                          ),
                                        ),
                                      ],
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
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
