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
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: onTapSearch,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        PopupMenuButton(
          itemBuilder: (context) => [],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
