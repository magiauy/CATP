import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/sos_controller.dart';
import '../widgets/sos_card.dart';
import '../../constants/constants.dart';

class SOSScreen extends StatefulWidget {
  const SOSScreen({super.key});

  @override
  State<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SOSController(),
      child: Consumer<SOSController>(
        builder: (context, sosController, child) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFC62A3E), Color(0xFF3B3038)],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // Header
                    _buildHeader(context),

                    // Emergency Button
                    _buildEmergencyButton(context, sosController),

                    // Services List
                    Expanded(child: _buildServicesList(context, sosController)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios, color: AppColors.white, size: 24),
            const SizedBox(width: 4),
            Text(
              AppStrings.backButton,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(
    BuildContext context,
    SOSController sosController,
  ) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: GestureDetector(
                onTap: () => sosController.makeEmergencyCall('113'),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.redSOS,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => sosController.makeEmergencyCall('113'),
                      splashColor: Colors.white.withValues(alpha: 0.2),
                      highlightColor: Colors.white.withValues(alpha: 0.1),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              AppStrings.sosTitle,
                              style: const TextStyle(
                                fontSize: 49,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildServicesList(BuildContext context, SOSController sosController) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Services List
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // Emergency Number Card
                  EmergencyNumberCard(
                    number: '113',
                    title: AppStrings.emergencyCall,
                    onTap: () => sosController.makeEmergencyCall('113'),
                  ),

                  // Service Cards
                  SosCard(
                    title: AppStrings.childProtection,
                    iconPath: ImagesConstants.childProtectionIcon,
                    onTap: () => sosController.handleServiceCardTap(
                      context,
                      AppStrings.childProtection,
                    ),
                  ),

                  SosCard(
                    title: AppStrings.publicSafety,
                    iconPath: ImagesConstants.publicSafetyIcon,
                    onTap: () => sosController.handleServiceCardTap(
                      context,
                      AppStrings.publicSafety,
                    ),
                  ),

                  SosCard(
                    title: AppStrings.antiNarcotics,
                    iconPath: ImagesConstants.antiNarcoticsIcon,
                    onTap: () => sosController.handleServiceCardTap(
                      context,
                      AppStrings.antiNarcotics,
                    ),
                  ),

                  SosCard(
                    title: AppStrings.publicRelations,
                    iconPath: ImagesConstants.publicRelationsIcon,
                    onTap: () => sosController.handleServiceCardTap(
                      context,
                      AppStrings.publicRelations,
                    ),
                  ),

                  SosCard(
                    title: AppStrings.counseling,
                    iconPath: ImagesConstants.counselingIcon,
                    onTap: () => sosController.handleServiceCardTap(
                      context,
                      AppStrings.counseling,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
