import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../core/widgets/flag_toggle.dart';
import '../../gen/assets.gen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  Assets.images.logo2.path,
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 40),

              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                iconPath: Assets.icons.mail.path,
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
              const SizedBox(height: 16),

              CustomTextFormField(
                controller: passwordController,
                hintText: 'Password',
                iconPath: Assets.icons.lock.path,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  child: Text(
                    'Forget Password?',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: AppColors.primary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              CustomButtonWidget(
                buttonText: 'Login',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  }
                },
                backgroundColor: AppColors.primary,
                textColor: AppColors.buttonGrey,
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account?",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: Text(
                      'Create One',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),

                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.primary,
                      thickness: 2,
                      endIndent: 15,
                      indent: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'OR',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.primary,
                      thickness: 2,
                      endIndent: 30,
                      indent: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              CustomButtonWidget(
                buttonText: 'Login With Google',
                onPressed: () {},
                backgroundColor: AppColors.primary,
                textColor: AppColors.buttonGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.google, width: 24, height: 24),
                    const SizedBox(width: 10),
                    Text(
                      'Login With Google',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: AppColors.buttonGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

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
              const SizedBox(height: 30),
            ],
          ),

        ),
      ),
    );
  }
}


