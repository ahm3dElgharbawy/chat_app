import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomStatusCard extends StatelessWidget {
  const CustomStatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showAddIcon = false,
  });
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showAddIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Row(
        children: [
          Stack(
            children: [
              //? current user avatar
              Container(
                height: 55,
                width: 55,
                margin: const EdgeInsetsDirectional.only(end: 5),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(ImageStrings.user),
                  ),
                  shape: BoxShape.circle,
                  border: showAddIcon
                      ? null
                      : Border.all(color: AppColors.primary, width: 2),
                ),
              ),
              //? add status icon
              Visibility(
                visible: showAddIcon,
                child: Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          AppSizes.w10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.semibold30),
              Text(subtitle,
                  style: TextStyles.regular30.copyWith(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
