import 'package:chat_app/core/constants/image_strings.dart';
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
            height: 100,
            width: 100,
            margin: const EdgeInsetsDirectional.only(end: 5),
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
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
