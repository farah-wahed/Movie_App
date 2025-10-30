import 'package:flutter/material.dart';
import 'package:movies_app/modules/auth/login_screen.dart';
import '../modules/auth/forget_password_screen.dart';
import '../modules/auth/register_screen.dart';
<<<<<<< HEAD
=======
import '../modules/onboarding/onborading_page1.dart';
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
import '../modules/splash/splash_screen.dart';
import '../modules/onboarding/onboarding_screen.dart';
import '../modules/home/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = 'onboarding';
<<<<<<< HEAD
=======
  static const String onboardingPage1 = 'onboardingPage1 ';
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
  static const String login = 'login';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String home = 'home';

<<<<<<< HEAD
=======

>>>>>>> 538b547 (splash and onboarding and auth ui handling)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const Register());

      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
<<<<<<< HEAD
=======
      case onboardingPage1:
        return MaterialPageRoute(builder: (_) => const OnboardingPage1());
>>>>>>> 538b547 (splash and onboarding and auth ui handling)

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
