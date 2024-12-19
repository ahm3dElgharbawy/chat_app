import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: 30.h,
        width: 30.h,
        child: const FittedBox(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}