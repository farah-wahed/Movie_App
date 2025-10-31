import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? child;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.backgroundColor,
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: backgroundColor ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),
      child: child ??
          Text(
            buttonText,
            style: theme.textTheme.titleLarge?.copyWith(
              color: textColor ?? AppColors.background,
            )

          ),
    );
  }
}
