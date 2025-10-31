import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
import '../../gen/assets.gen.dart';


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

     Navigator.pushReplacementNamed(context, AppRoutes.login);
   } else {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingPage1);}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          Assets.images.splash.path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
