import 'package:flutter/material.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/login_screen.dart';
import '../views/screens/register_screen.dart';
import '../views/screens/forgot_password_screen.dart';
import '../views/screens/alert_demo_screen.dart';
import '../views/screens/age_selection_screen.dart';
import '../screens/sos_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String forgotPassword = '/forgot-password';
  static const String alertDemo = '/alert-demo';
  static const String ageSelection = '/age-selection';
  static const String teenHome = '/teen-home';
  static const String adultHome = '/adult-home';
  static const String sos = '/sos';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    alertDemo: (context) => const AlertDemoScreen(),
    ageSelection: (context) => const AgeSelectionScreen(),
    sos: (context) => const SOSScreen(),
    // Thêm các routes khác ở đây
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case alertDemo:
        return MaterialPageRoute(builder: (context) => const AlertDemoScreen());
      case ageSelection:
        return MaterialPageRoute(
          builder: (context) => const AgeSelectionScreen(),
        );
      case sos:
        return MaterialPageRoute(builder: (context) => const SOSScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Not Found')),
            body: const Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
