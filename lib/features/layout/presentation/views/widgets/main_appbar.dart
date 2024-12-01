import 'dart:developer';

import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/login_screen.dart';
import 'package:chat_app/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title = "WhatsUp",
    this.onTapSearch,
  });
  final String title;
  final VoidCallback? onTapSearch;

  @override
  Widget build(BuildContext context) {
    List<Map> popupMenuItems = [
      {'title': 'Profile', 'target': ProfileScreen.routeName},
      {'title': 'New group', 'target': ""},
      {'title': 'Settings', 'target': ""},
      {'title': 'Logout', 'target': LoginScreen.routeName, 'color': Colors.red},
    ];
    return AppBar(
      toolbarHeight: kToolbarHeight.r,
      title: Text(title, style: TextStyles.medium24),
      elevation: 1,
      shadowColor: Colors.grey,
      automaticallyImplyLeading: false,
      notificationPredicate: (notification) =>
          false, // disable appbar color changing when scrolling
      surfaceTintColor: Colors.transparent,
      actions: [
        CustomIconButton(
          onTap: onTapSearch ?? () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 24.r,
          ),
        ),
        PopupMenuButton(
          position: PopupMenuPosition.under,
          iconSize: 24.r,
          padding: EdgeInsets.all(8.r),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          itemBuilder: (context) => [
            ...popupMenuItems.map<PopupMenuItem>(
              (item) => PopupMenuItem(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                height: kMinInteractiveDimension.h,
                child: Text(
                  item['title'],
                  softWrap: false,
                  style: TextStyles.regular14
                      .copyWith(color: item['color'] ?? Colors.black),
                ),
                onTap: () async {
                  if (item['title'] == 'Logout') {
                    await FirebaseAuthService.logout();
                    log("success logout");
                  }
                  if (context.mounted) {
                    context.pushNamed(item['target']);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.r);
}
