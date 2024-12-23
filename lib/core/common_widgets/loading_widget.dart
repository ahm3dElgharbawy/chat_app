import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key,this.color = AppColors.primary});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: 30.h,
        width: 30.h,
        child:  FittedBox(
          child: CircularProgressIndicator(color: color,),
        ),
      ),
    );
  }
}