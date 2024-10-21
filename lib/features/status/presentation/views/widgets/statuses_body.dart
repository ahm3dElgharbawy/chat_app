import 'package:chat_app/core/common_widgets/list_tile.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/common_widgets/section_text.dart';
import 'package:flutter/material.dart';

class StatusesBody extends StatelessWidget {
  const StatusesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            title: "My Status",
            subtitle: "tap to add status update",
            onTap: () {},
            subLeading: const Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          AppSizes.h10,
          const CustomSectionText(text: 'Recent updates'),
          ...List.generate(
            3,
            (i) => CustomListTile(
              title: "Marwan Ali",
              subtitle: "Today, 12:00 PM",
              onTap: () {},
            ),
          ),
          AppSizes.h10,
          const CustomSectionText(text: 'Viewed updates'),
          ...List.generate(
            3,
            (i) => CustomListTile(
              title: "Marwan Ali",
              subtitle: "Today, 12:00 PM",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
