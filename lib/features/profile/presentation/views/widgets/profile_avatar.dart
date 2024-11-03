import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          //? current user avatar
          Container(
            height: 100.r,
            width: 100.r,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageStrings.user),
              ),
              shape: BoxShape.circle,
            ),
          ),
          //? add status icon
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 20.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
