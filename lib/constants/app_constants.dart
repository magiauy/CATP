class AppConstants {
  // API endpoints
  static const String baseUrl = 'https://api.example.com';
  static const String usersEndpoint = '/users';
  static const String authEndpoint = '/auth';
  
  // Storage keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  
  // App settings
  static const int requestTimeout = 30;
  static const int itemsPerPage = 20;
  static const String defaultLanguage = 'vi';
  
  // Asset paths
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';
  static const String fontsPath = 'assets/fonts/';
  
  // Error messages
  static const String networkError = 'Lỗi kết nối mạng';
  static const String serverError = 'Lỗi máy chủ';
  static const String unknownError = 'Đã xảy ra lỗi không xác định';
  
  // Success messages
  static const String dataLoadedSuccess = 'Tải dữ liệu thành công';
  static const String operationSuccess = 'Thao tác thành công';
}
