import 'package:chat_app/core/common_widgets/list_tile.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/common_widgets/section_text.dart';
import 'package:flutter/material.dart';

class CallsBody extends StatelessWidget {
  const CallsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSectionText(text: 'Recent'),
          ...List.generate(
            10,
            (i) => CustomListTile(
              title: "Marwan Ali",
              subtitle: "Today, 12:00 PM",
              onTap: () {},
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
