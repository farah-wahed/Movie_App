import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FlagToggle extends StatefulWidget {
  final Widget child1;
  final Widget child2;
  final void Function(int index)? onTap;


  const FlagToggle({
    super.key,
    required this.child1,
    required this.child2, this.onTap,

  });

  @override
  State<FlagToggle> createState() => _FlagToggleState();
}

class _FlagToggleState extends State<FlagToggle> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildChild(widget.child1, 0),
          const SizedBox(width: 8),
          _buildChild(widget.child2, 1),
        ],
      ),
    );
  }

  Widget _buildChild(Widget child, int index) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          widget.onTap!(index);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.primary : Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
