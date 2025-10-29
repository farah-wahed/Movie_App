import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(MoviesApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MoviesApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MoviesApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: hasSeenOnboarding
          ? AppRoutes.splash
          : AppRoutes.onboarding,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

