import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.image = ImageStrings.user,
    this.enableBorder = false,
    this.subLeading,
    this.trailing,
  });
  final String title;
  final String subtitle;
  final String image;
  final bool enableBorder;
  final VoidCallback onTap;
  final Widget? subLeading;
  final Widget? trailing;

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
                    border: enableBorder
                        ? Border.all(color: AppColors.primary)
                        : null),
              ),
              //? addition icons on avatar
              if (subLeading != null)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: subLeading),
                ),
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
          ),
          if (trailing != null) const Spacer(),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}
