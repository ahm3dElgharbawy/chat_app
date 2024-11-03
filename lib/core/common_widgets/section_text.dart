import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomSectionText extends StatelessWidget {
  const CustomSectionText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace.r),
      child:Text(text, style: TextStyles.medium14.copyWith(color: Colors.grey)),
    );
  }
}
