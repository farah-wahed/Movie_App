import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../config/routes.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../core/widgets/flag_toggle.dart';
import '../../gen/assets.gen.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedAvatar = 1;
  int _currentIndex = 0;
  final _formKey = GlobalKey<FormState>();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(AppAssets.back, width: 21, height: 21),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Register'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Column(
                  children: [
                    CarouselSlider(
                      items: List.generate(9, (index) {
                        int avatarId = index + 1;
                        bool isSelected = avatarId == selectedAvatar;

                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedAvatar = avatarId);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                              boxShadow: [
                                if (isSelected)
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/avatar$avatarId.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 16 / 8,
                        viewportFraction: 0.35,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.35,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() => _currentIndex = index);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Text(
                  'Avatar',
                  style: theme.textTheme.bodyLarge
              ),
              const SizedBox(height: 20),

              CustomTextFormField(
                controller: nameController,
                hintText: 'Name',
                iconPath: AppAssets.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                iconPath: AppAssets.mail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: passwordController,
                hintText: 'Password',
                iconPath: AppAssets.lock,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                iconPath: AppAssets.lock,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: phoneController,
                hintText: 'Phone Number',
                iconPath: AppAssets.call,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: CustomButtonWidget(
                  buttonText: 'Create Account',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }
                  },
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.background,
                ),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account?",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    child: Text(
                      'Login',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlagToggle(
                    child1: ClipOval(
                      child: Assets.icons.en.image(width: 30, height: 30),
                    ),
                    child2: ClipOval(
                      child: Assets.icons.ar.image(width: 30, height: 30),
                    ),
                    onTap: (index) {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),

        ),
      ),
    );
  }
}