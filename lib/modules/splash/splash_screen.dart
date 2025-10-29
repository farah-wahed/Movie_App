import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
=======
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
import '../../gen/assets.gen.dart';
>>>>>>> 538b547 (splash and onboarding and auth ui handling)

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(
        Duration(seconds: 3)
    );

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {
<<<<<<< HEAD
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    }
=======
     Navigator.pushReplacementNamed(context, AppRoutes.login);
   } else {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingPage1);}
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
<<<<<<< HEAD
          AppAssets.splash,
=======
          Assets.images.splash.path,
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
