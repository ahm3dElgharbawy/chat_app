import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    required this.child,
    this.size = 25,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
  });
  final String child;
  final double size;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Text(
        child,
        style: TextStyles.semibold12.copyWith(color: textColor),
      ),
    );
  }
}
