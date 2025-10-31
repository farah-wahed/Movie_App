import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/const_data.dart';
import '../../core/widgets/custom_button_widget.dart';
import '../../models/onboarding_page_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingPageModel> _pages = ConstData.pages;


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
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemBuilder: (context, index) {

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(_pages[index].image, fit: BoxFit.cover),
              Container(color: Colors.black38),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
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

                        _pages[index].title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall
                      ),
                      SizedBox(height: 10),
                      if ((index != _pages.length - 1)) ...[
                        Text(
                          _pages[index].description,
                          textAlign: TextAlign.center,
                          style:  theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400
                          )
                        ),
                        SizedBox(height: 25),
                      ],

                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: CustomButtonWidget(
                              onPressed: _nextPage,
                              buttonText: _pages[index].buttonText,
                              backgroundColor: AppColors.primary,
                              textColor: AppColors.background,
                            ),
                          ),

                          if (index != 0) ...[
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: SizedBox(
                                width: double.infinity,
                                child: CustomButtonWidget(
                                  onPressed: _prevPage,
                                  buttonText: 'Back',
                                  backgroundColor: Colors.transparent,
                                  textColor: AppColors.primary,
                                  child: Text(
                                    'Back',
                                    style:theme.textTheme.titleLarge?.copyWith(
                                      color: AppColors.primary,
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
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