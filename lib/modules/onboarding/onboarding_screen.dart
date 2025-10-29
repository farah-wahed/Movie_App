import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': AppAssets.on1,
      'title': 'Find Your Next Favorite Movie Here',
      'desc':
      'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      'btn': 'Explore Now'
    },
    {
      'image': AppAssets.on2,
      'title': 'Discover Movies',
      'desc':
      'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      'btn': 'Next'
    },
    {
      'image': AppAssets.on3,
      'title': 'Explore All Genres',
      'desc':
      'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      'btn': 'Next'
    },
    {
      'image': AppAssets.on4,
      'title': 'Create Watchlist',
      'desc':
      'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      'btn': 'Next'
    },
    {
      'image': AppAssets.on5,
      'title': 'Rate, Review, and Learn',
      'desc':
      'Share your thoughts on the movies you have watched. Dive deep into film details and help others discover great movies with your reviews.',
      'btn': 'Next'
    },
    {
      'image': AppAssets.on6,
      'title': 'Start Watching Now',
      'desc': '',
      'btn': 'Finish'
    },
  ];

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingSeen', true);
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  void _nextPage() async {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasSeenOnboarding', true);
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }
  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration:Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemBuilder: (context, index) {
          final page = _pages[index];

          if (index == 0) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(page['image']!, fit: BoxFit.cover),
                Padding(
                  padding:EdgeInsets.fromLTRB(24, 0, 24, 60),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 10),
                        Text(
                          page['desc']!,
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              page['btn']!,
                              style:TextStyle(
                                color: AppColors.background,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(page['image']!, fit: BoxFit.cover),
              Container(color: Colors.black.withOpacity(0.3)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: 24, vertical: 30),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        page['title']!,
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          color: AppColors.text,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        page['desc']!,
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                 SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            page['btn']!,
                            style:TextStyle(
                              color: AppColors.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      if (_currentPage >= 2)
                        Padding(
                          padding:EdgeInsets.only(top: 12),
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: _prevPage,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: AppColors.primary, width: 2),
                                padding: EdgeInsets.symmetric(
                                    vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child:Text(
                                'Back',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


