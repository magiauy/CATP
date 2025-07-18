class RegexConstants {
  // Email validation
  static const String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  // Password validation patterns
  static const String password =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static const String passwordMinLength = r'^.{8,}$';
  static const String passwordWithNumber = r'^(?=.*\d).+$';
  static const String passwordWithUppercase = r'^(?=.*[A-Z]).+$';
  static const String passwordWithLowercase = r'^(?=.*[a-z]).+$';
  static const String passwordWithSpecialChar = r'^(?=.*[@$!%*?&]).+$';

  // Phone number validation
  static const String phoneVN = r'^(0[3|5|7|8|9])+([0-9]{8})$';
  static const String phoneInternational = r'^\+?[1-9]\d{1,14}$';

  // Name validation
  static const String name =
      r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵýỷỹ\s]+$';
  static const String nameNoSpecialChar = r'^[a-zA-Z\s]+$';

  // URL validation
  static const String url =
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

  // Date validation (dd/mm/yyyy)
  static const String dateVietnamese =
      r'^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$';
  static const String dateISO =
      r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$';

  // Number validation
  static const String numbersOnly = r'^[0-9]+$';
  static const String decimal = r'^[0-9]+(\.[0-9]+)?$';
  static const String currency = r'^\d{1,3}(,\d{3})*(\.\d{2})?$';

  // Vietnamese ID card
  static const String vietnameseID = r'^[0-9]{9}$|^[0-9]{12}$';

  // Credit card
  static const String creditCard = r'^[0-9]{13,19}$';

  // Social media usernames
  static const String username = r'^[a-zA-Z0-9_]{3,20}$';

  // IP address
  static const String ipAddress =
      r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';

  // HTML tags removal
  static const String htmlTags = r'<[^>]*>';

  // Whitespace patterns
  static const String multipleSpaces = r'\s+';
  static const String leadingTrailingSpaces = r'^\s+|\s+$';

  // File extensions
  static const String imageExtensions = r'\.(jpg|jpeg|png|gif|bmp|webp)$';
  static const String documentExtensions =
      r'\.(pdf|doc|docx|xls|xlsx|ppt|pptx)$';

  // Color hex codes
  static const String hexColor = r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$';

  // Compiled RegExp objects for better performance
  static final RegExp emailRegex = RegExp(email);
  static final RegExp passwordRegex = RegExp(password);
  static final RegExp phoneVNRegex = RegExp(phoneVN);
  static final RegExp nameRegex = RegExp(name);
  static final RegExp urlRegex = RegExp(url);
  static final RegExp numbersOnlyRegex = RegExp(numbersOnly);
  static final RegExp vietnameseIDRegex = RegExp(vietnameseID);
  static final RegExp usernameRegex = RegExp(username);
  static final RegExp ipAddressRegex = RegExp(ipAddress);
  static final RegExp htmlTagsRegex = RegExp(htmlTags);
  static final RegExp multipleSpacesRegex = RegExp(multipleSpaces);
  static final RegExp imageExtensionsRegex = RegExp(
    imageExtensions,
    caseSensitive: false,
  );
  static final RegExp documentExtensionsRegex = RegExp(
    documentExtensions,
    caseSensitive: false,
  );
  static final RegExp hexColorRegex = RegExp(hexColor, caseSensitive: false);

  // Helper methods for validation
  static bool isValidEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return passwordRegex.hasMatch(password);
  }

  static bool isValidPhoneVN(String phone) {
    return phoneVNRegex.hasMatch(phone);
  }

  static bool isValidName(String name) {
    return nameRegex.hasMatch(name);
  }

  static bool isValidUrl(String url) {
    return urlRegex.hasMatch(url);
  }

  static bool isValidVietnameseID(String id) {
    return vietnameseIDRegex.hasMatch(id);
  }

  static bool isValidUsername(String username) {
    return usernameRegex.hasMatch(username);
  }

  static bool isValidIPAddress(String ip) {
    return ipAddressRegex.hasMatch(ip);
  }

  static bool isValidHexColor(String color) {
    return hexColorRegex.hasMatch(color);
  }

  static bool isImageFile(String filename) {
    return imageExtensionsRegex.hasMatch(filename);
  }

  static bool isDocumentFile(String filename) {
    return documentExtensionsRegex.hasMatch(filename);
  }

  // Text cleaning methods
  static String removeHtmlTags(String text) {
    return text.replaceAll(htmlTagsRegex, '');
  }

  static String normalizeSpaces(String text) {
    return text.replaceAll(multipleSpacesRegex, ' ').trim();
  }

  static String removeLeadingTrailingSpaces(String text) {
    return text.replaceAll(RegExp(leadingTrailingSpaces), '');
  }

  // Password strength checker
  static Map<String, bool> checkPasswordStrength(String password) {
    return {
      'hasMinLength': RegExp(passwordMinLength).hasMatch(password),
      'hasNumber': RegExp(passwordWithNumber).hasMatch(password),
      'hasUppercase': RegExp(passwordWithUppercase).hasMatch(password),
      'hasLowercase': RegExp(passwordWithLowercase).hasMatch(password),
      'hasSpecialChar': RegExp(passwordWithSpecialChar).hasMatch(password),
    };
  }

  // Extract patterns
  static List<String> extractEmails(String text) {
    return emailRegex.allMatches(text).map((match) => match.group(0)!).toList();
  }

  static List<String> extractUrls(String text) {
    return urlRegex.allMatches(text).map((match) => match.group(0)!).toList();
  }

  static List<String> extractNumbers(String text) {
    return numbersOnlyRegex
        .allMatches(text)
        .map((match) => match.group(0)!)
        .toList();
  }
}
