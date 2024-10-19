import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/styles.dart';
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
    return AppBar(
      title: Text(title, style: TextStyles.medium48),
      elevation: 1,
      shadowColor: Colors.grey,
      automaticallyImplyLeading: false,
      notificationPredicate : (notification) => false, // disable appbar color changing when scrolling
      surfaceTintColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: onTapSearch,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        PopupMenuButton(
          position: PopupMenuPosition.under,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Profile", style: TextStyles.regular30),
              onTap: () {
                context.pushNamed(AppRoutes.profile);
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
