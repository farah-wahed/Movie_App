import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
=======
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
import 'core/theme/app_theme.dart';
import 'config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD

  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(MoviesApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MoviesApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MoviesApp({super.key, required this.hasSeenOnboarding});
=======
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
>>>>>>> 538b547 (splash and onboarding and auth ui handling)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
<<<<<<< HEAD
      initialRoute: hasSeenOnboarding
          ? AppRoutes.splash
          : AppRoutes.onboarding,
=======
      initialRoute: AppRoutes.splash,
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

