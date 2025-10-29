import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text_form_field.dart';
<<<<<<< HEAD

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
=======
import '../../gen/assets.gen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            AppAssets.back,
            width: 21,
            height: 21,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
<<<<<<< HEAD
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.forgetPassword,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),

            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Padding(
                padding:EdgeInsets.all(12.0),
                child: Image.asset(
                  AppAssets.mail,
                  width: 24,
                  height: 24,
                  color: AppColors.text,
                ),
              ),
            ),

            SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child:Text(
                  'Verify Email',
                  style: TextStyle(
                    color: AppColors.background,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

          ],
=======
        title: const Text('Forget Password'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.forgetPassword,
                width: double.infinity,
                height: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

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

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Verification link sent to your email'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Verify Email',
                    style: TextStyle(
                      color: AppColors.background,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
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
// import '../../../core/constants/app_assets.dart';
// import '../../../core/constants/app_colors.dart';
//
// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         leading: IconButton(
//            icon: Image.asset(
//            AppAssets.back,
//             width: 21,
//             height: 21,
//             color: AppColors.primary,
//           ),
//           onPressed: () => Navigator.pop(context),
//           ),
//         title:Text(
//           'Forget Password',
//           style: TextStyle(
//             color: AppColors.primary,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//            ),
//            ),
//         centerTitle: true,
//        ),
//       body: SingleChildScrollView(
//         padding:EdgeInsets.symmetric(horizontal: 24, vertical: 40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               AppAssets.forgetPassword,
//               width: double.infinity,
//               height: 220,
//               fit: BoxFit.cover,
//             ),
//           SizedBox(height: 30),
//             TextField(
//               style:TextStyle(
//                   color: AppColors.text
//               ),
//               decoration: InputDecoration(
//                 hintText: 'Email',
//                 hintStyle: TextStyle(color: AppColors.text),
//                 prefixIcon: Padding(
//                   padding:EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Image.asset(
//                     AppAssets.mail,
//                     width: 24,
//                     height: 24,
//                      color: AppColors.text,
//                   ),
//                 ),
//                 filled: true,
//                 fillColor: AppColors.buttonGrey,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide.none,
//                 ),),
//              ),
//              SizedBox(height: 25),
//
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.login);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   padding:EdgeInsets.symmetric(vertical: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//                 child:Text(
//                   'Verify Email',
//                   style: TextStyle(
//                     color: AppColors.background,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
=======
>>>>>>> 538b547 (splash and onboarding and auth ui handling)
