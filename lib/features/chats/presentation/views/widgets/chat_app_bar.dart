import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChatAppbar(
      {super.key, required this.username, required this.image});
  final String username;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight.r,
      leading: CustomIconButton(
        icon: Icon(Icons.arrow_back, size: 24.r),
        onTap: () => context.pop(),
      ),
      leadingWidth: 50.w,
      title: Row(
        children: [
          CustomCircularImage(
            image: image,
            size: 40.r,
          ),
          AppSizes.w10,
          Expanded(
            child: Text(
              username,
              style: TextStyles.medium17,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
      titleSpacing: -10,
      notificationPredicate: (notification) =>
          false, // disable appbar color changing when scrolling

      actions: [
        CustomIconButton(
          onTap: () {},
          icon: Icon(Icons.videocam_rounded, size: 24.r),
        ),
        CustomIconButton(
          onTap: () {},
          icon: Icon(Icons.phone, size: 24.r),
        ),
        PopupMenuButton(
          position: PopupMenuPosition.under,
          iconSize: 24.r,
          padding: EdgeInsets.all(8.r),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          itemBuilder: (context) => [],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.r);
}
