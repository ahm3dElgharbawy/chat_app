import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomChatAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomChatAppbar({super.key, required this.username, required this.image});
  final String username;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CustomCircularImage(
            image: image,
            size: 40,
          ),
          AppSizes.w10,
          Expanded(
            child: Text(
              username,
              style: TextStyles.medium34,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
      titleSpacing: -10,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
        PopupMenuButton(
          itemBuilder: (context) => [],
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
