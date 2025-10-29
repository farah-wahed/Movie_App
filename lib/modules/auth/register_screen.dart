import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_button_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedAvatar = 1;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
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
        title:Text(
          'Register',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
          //avatar
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  int avatarId = index + 1;
                  bool isSelected = avatarId == selectedAvatar;

                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedAvatar = avatarId);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: isSelected ? 90 : 70,
                      height: isSelected ? 90 : 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? AppColors.primary : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/avatar$avatarId.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
             Text(
              'Avatar',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              controller: nameController,
              hintText: 'Name',
              iconPath: AppAssets.name,
            ),
            SizedBox(height: 12),
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              iconPath: AppAssets.mail,
            ),
       SizedBox(height: 12),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              iconPath: AppAssets.lock,
              isPassword: true,
            ),
           SizedBox(height: 12),
            CustomTextFormField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              iconPath: AppAssets.lock,
              isPassword: true,
            ),
            SizedBox(height: 12),
            CustomTextFormField(
              controller: phoneController,
              hintText: 'Phone Number',
              iconPath: AppAssets.call,
            ),
        SizedBox(height: 20),

         //acc
            SizedBox(
              width: double.infinity,
              child: CustomButtonWidget(
                buttonText: 'Create Account',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
                backgroundColor: AppColors.primary,
                textColor: AppColors.background,
              ),
            ),
          SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have Account?",
                  style: TextStyle(color: AppColors.text, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  child:Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
         SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.en, width: 40, height: 25),
              SizedBox(width: 10),
                Image.asset(AppAssets.ar, width: 40, height: 25),
              ],
            ),
           SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../../../config/routes.dart';
// import '../../../core/constants/app_assets.dart';
// import '../../../core/constants/app_colors.dart';
//
// class Register extends StatefulWidget {
//   const Register({super.key});
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   int selectedAvatar = 1;
//   bool _isPasswordVisible1 = false;
//   bool _isPasswordVisible2 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         leading: IconButton(
//           icon: Image.asset(
//             AppAssets.back,
//             width: 21,
//             height: 21,
//             color: AppColors.primary,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title:Text(
//           'Register',
//           style: TextStyle(
//             color: AppColors.primary,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//           ),
//          ),
//         centerTitle: true,
//        ),
//
// //
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         child: Column(
//           children: [
//  //
//             SizedBox(
//               height: 110,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 9,
//                 itemBuilder: (context, index) {
//                   int avatarId = index + 1;
//                   bool isSelected = avatarId == selectedAvatar;
//
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() => selectedAvatar = avatarId);
//                      },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       margin: const EdgeInsets.symmetric(horizontal: 8),
//                       width: isSelected ? 90 : 70,
//                       height: isSelected ? 90 : 70,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: isSelected
//                               ? AppColors.primary
//                               : Colors.transparent,
//                            width: 3,
//                          ),
//                         ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/images/avatar$avatarId.png',
//                           fit: BoxFit.cover,
//                         ),
//                        ),
//                     ),);
//                 },
//                ),
//             ),
//              SizedBox(height: 10),
//              Text(
//               'Avatar',
//               style: TextStyle(
//                 color: AppColors.text,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//            SizedBox(height: 15),
// //
//             _buildField('Name', AppAssets.name,),
//             _buildField('Email', AppAssets.mail),
//             _buildField('Password', AppAssets.lock,
//                 isPassword: true, isVisible: _isPasswordVisible1, onEyeTap: () {
//                   setState(() {
//                     _isPasswordVisible1 = !_isPasswordVisible1;
//                   });
//              }),
//             _buildField('Confirm Password', AppAssets.lock,
//                 isPassword: true, isVisible: _isPasswordVisible2, onEyeTap: () {
//                   setState(() {
//                     _isPasswordVisible2 = !_isPasswordVisible2;
//                   });
//                  }),
//             _buildField('Phone Number', AppAssets.call),
//        SizedBox(height: 5),
// //
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(
//                       context, AppRoutes.home);
//                  },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   padding: EdgeInsets.symmetric(
//                       vertical: 16
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                  ),
//                 child: Text(
//                   'Create Account',
//                   style: TextStyle(
//                     color: AppColors.background,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 18,
//                   ),
//                 ),),
//              ),
//             SizedBox(height: 8),
// //
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//               Text(
//                   "Already Have Account?",
//                   style: TextStyle(
//                       color: AppColors.text,
//                       fontSize: 14),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(
//                         context, AppRoutes.login
//                     );
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       color:AppColors.primary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                    ),
//                 ),
//                 ],
//              ),
// //
//          SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                     AppAssets.en,
//                     width: 40,
//                     height: 25
//                 ),
//                 SizedBox(width: 10),
//                 Image.asset(
//                     AppAssets.ar,
//                     width: 40,
//                     height: 25
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// //call back function
//   Widget _buildField(
//       String hint,
//       String iconPath, {
//          bool isPassword = false,
//         bool isVisible = false,
//          VoidCallback? onEyeTap,
//        }) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 16),
//       child: TextField(
//         obscureText: isPassword ? !isVisible : false,
//         style:  TextStyle(
//             color: AppColors.text
//         ),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle:TextStyle(
//               color:AppColors.text,
//               fontSize: 14
//           ),
//           prefixIcon: Padding(
//             padding: EdgeInsets.all(12.0),
//             child: Image.asset(
//               iconPath,
//               width: 22,
//               height: 22,
//               color: AppColors.text,
//             ),
//           ),
//           suffixIcon: isPassword
//               ? IconButton(
//             icon: Icon(
//               isVisible ? Icons.visibility : Icons.visibility_off,
//               color: AppColors.text,
//              ),
//             onPressed: onEyeTap,
//           )
//               : null,
//           filled: true,
//           fillColor: AppColors.buttonGrey,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
