import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String? iconPath;
  final Widget? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.iconPath,
    this.isPassword = false,
    this.controller,
    this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? !_isVisible : false,
      style: const TextStyle(color: AppColors.text),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.text),
        prefixIcon: widget.iconPath != null
            ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            widget.iconPath!,
            width: 24,
            height: 24,
            color: AppColors.text,
          ),
        )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.text,
          ),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
        )
            : null,
        filled: true,
        fillColor: AppColors.buttonGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
