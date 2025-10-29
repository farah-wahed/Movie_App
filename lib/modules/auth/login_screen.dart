import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_button_widget.dart';
<<<<<<< HEAD
=======
import '../../core/widgets/flag_toggle.dart';
import '../../gen/assets.gen.dart';
>>>>>>> 538b547 (splash and onboarding and auth ui handling)

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
<<<<<<< HEAD
=======
  final _formKey = GlobalKey<FormState>();
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding:EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                AppAssets.logo,
                width: 90,
                height: 90,
              ),
            ),
         SizedBox(height: 40),

          //email
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              iconPath: AppAssets.mail,
            ),
          SizedBox(height: 16),

        // password
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              iconPath: AppAssets.lock,
              isPassword: true,
            ),
         SizedBox(height: 12),

          //forget pass
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.forgetPassword);
                },
                child:Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
           SizedBox(height: 20),

         //login
            CustomButtonWidget(
              buttonText: 'Login',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              },
              backgroundColor: AppColors.primary,
              textColor: AppColors.buttonGrey,
            ),
          SizedBox(height: 15),

          //acc
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(
                  "Don't Have Account?",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child:Text(
                    'Create One',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 15),
            //or
            Row(
              children: [
                Expanded(
                    child: Divider(color: AppColors.primary, thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'OR',
                    style: TextStyle(color: AppColors.primary, fontSize: 15),
                  ),
                ),
                Expanded(
                    child: Divider(color: AppColors.primary, thickness: 1)),
              ],
            ),
           SizedBox(height: 30),

         //google
            CustomButtonWidget(
              buttonText: 'Login With Google',
              onPressed: () {},
              backgroundColor: AppColors.primary,
              textColor: AppColors.buttonGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.google, width: 24, height: 24),
                   SizedBox(width: 10),
                  Text(
                    'Login With Google',
                    style: TextStyle(
                      color: AppColors.buttonGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
=======
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
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
                    ),
                  ),
                ],
              ),
<<<<<<< HEAD
            ),
           SizedBox(height: 40),

        //lang.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.en, width: 40, height: 25),
                 SizedBox(width: 15),
                Image.asset(AppAssets.ar, width: 40, height: 25),
              ],
            ),
          SizedBox(height: 30),
          ],
=======
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
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
        ),
      ),
    );
  }
}
<<<<<<< HEAD




// import 'package:flutter/material.dart';
// import '../../../config/routes.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../core/constants/app_assets.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _isPasswordVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SingleChildScrollView(
//         padding:EdgeInsets.symmetric(horizontal: 24, vertical: 60),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Image.asset(
//                 AppAssets.logo,
//                 width: 90,
//                 height: 90,
//               ),
//             ),
//             const SizedBox(height: 40),
// //---
//             TextField(
//               style:TextStyle(color: AppColors.text),
//               decoration: InputDecoration(
//                 hintText: 'Email',
//                 hintStyle:TextStyle(color:AppColors.text),
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: Image.asset(
//                     AppAssets.mail,
//                     width: 24,
//                     height: 24,
//                    color: AppColors.text,
//                   ),
//                 ),
//                 filled: true,
//                 fillColor: AppColors.buttonGrey,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//
// //---
//             TextField(
//               obscureText: !_isPasswordVisible,
//               style: TextStyle(color: AppColors.text),
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 hintStyle: TextStyle(color: AppColors.text),
//                  prefixIcon: Padding(
//                   padding: EdgeInsets.all(12.0),
//                    child: Image.asset(
//                     AppAssets.lock,
//                     width: 24,
//                     height: 24,
//                     color: AppColors.text,
//                   ),
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _isPasswordVisible
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                       color: AppColors.text,
//                   ),
//                   onPressed: () {
//                      setState(() {
//                       _isPasswordVisible = !_isPasswordVisible;
//                     });
//                   },
//                 ),
//                 filled: true,
//                 fillColor: AppColors.buttonGrey,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             SizedBox(height: 12),
//
// //----
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoutes.forgetPassword);
//                 },
//                 child: Text(
//                   'Forget Password?',
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                   ),
//                 ),
//                ),
//             ),
//             SizedBox(height: 20),
//  //----
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.home);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   padding:EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//                 child:Text(
//                   'Login',
//                   style: TextStyle(
//                     color: AppColors.buttonGrey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
// //----
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Don't Have Account?",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, AppRoutes.register);
//                   },
//                   child:Text(
//                     'Create One',
//                     style: TextStyle(
//                       color: AppColors.primary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//  //-----
//             Row(
//               children: [
//                 Expanded(
//                  child: Divider(
//                       color: AppColors.primary,
//                         thickness: 1
//                     )),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     'OR',
//                     style: TextStyle(
//                         color: AppColors.primary,
//                         fontSize: 15),
//                   ),
//                 ),
//                 Expanded(
//                   child: Divider(
//                    color: AppColors.primary,
//                       thickness: 1
//                   )
//                 ),
//               ],
//             ),
//           SizedBox(height: 30),
//
// //------
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: Image.asset(
//                     AppAssets.google,
//                     width: 24,
//                     height: 24
//                 ),
//                 label: Text(
//                   'Login With Google',
//                   style: TextStyle(
//                     color: AppColors.buttonGrey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 18,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   ),
//                ),
//              ),
//             SizedBox(height: 40),
// //-----
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                     AppAssets.en,
//                     width: 40,
//                     height: 25
//                 ),
//                SizedBox(width: 15),
//                 Image.asset(
//                     AppAssets.ar,
//                     width: 40,
//                     height: 25
//                 ),
//               ],
//             ),
//          SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
=======
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
