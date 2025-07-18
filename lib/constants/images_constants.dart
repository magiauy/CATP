class ImagesConstants {
  // =================
  // BASE PATHS
  // =================
  static const String _basePath = 'assets/images/';
  static const String _iconsPath = 'assets/icons/';
  static const String _logosPath = 'assets/logos/';
  static const String _illustrationsPath = 'assets/illustrations/';
  static const String _backgroundsPath = 'assets/backgrounds/';

  // =================
  // LOGOS
  // =================
  static const String logo = '${_basePath}logo.png';

  // =================
  // SOCIAL MEDIA ICONS
  // =================
  static const String googleIcon = '${_iconsPath}Google.png';
  static const String facebookIcon = '${_iconsPath}Facebook.png';
  static const String appleIcon = '${_iconsPath}Apple.png';
  static const String twitterIcon = '${_iconsPath}Twitter.png';
  static const String linkedinIcon = '${_iconsPath}LinkedIn.png';

  // =================
  // AGE SELECTION ICONS
  // =================
  static const String ageGroup1Icon = '${_iconsPath}age_group_1.png';
  static const String ageGroup2Icon = '${_iconsPath}age_group_2.png';
  static const String teenIcon = '${_iconsPath}teen.png';
  static const String adultIcon = '${_iconsPath}adult.png';

  // =================
  // SOS ICONS
  // =================
  static const String sosIcon = '${_iconsPath}sos.png';
  static const String childProtectionIcon = '${_iconsPath}child_protection.png';
  static const String emergencyIcon = '${_iconsPath}emergency.png';
  static const String publicSafetyIcon = '${_iconsPath}public_safety.png';
  static const String antiNarcoticsIcon = '${_iconsPath}anti_narcotics.png';
  static const String publicRelationsIcon = '${_iconsPath}public_relations.png';
  static const String counselingIcon = '${_iconsPath}counseling.png';

  // =================
  // HELPER METHODS
  // =================

  /// Get full path for image
  static String getImagePath(String imageName) {
    return '$_basePath$imageName';
  }

  /// Get full path for icon
  static String getIconPath(String iconName) {
    return '$_iconsPath$iconName';
  }

  /// Get full path for logo
  static String getLogoPath(String logoName) {
    return '$_logosPath$logoName';
  }

  /// Get full path for illustration
  static String getIllustrationPath(String illustrationName) {
    return '$_illustrationsPath$illustrationName';
  }

  /// Get full path for background
  static String getBackgroundPath(String backgroundName) {
    return '$_backgroundsPath$backgroundName';
  }
}
