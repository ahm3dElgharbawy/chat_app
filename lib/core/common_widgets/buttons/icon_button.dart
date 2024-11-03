import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor, this.contentPadding,
  });
  final Widget icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onTap,
      style: IconButton.styleFrom(
        padding: contentPadding ?? EdgeInsets.all(8.r),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
