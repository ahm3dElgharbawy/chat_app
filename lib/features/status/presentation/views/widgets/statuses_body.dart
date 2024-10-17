import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/features/status/presentation/views/widgets/status_card.dart';
import 'package:chat_app/features/status/presentation/views/widgets/status_section_text.dart';
import 'package:flutter/material.dart';

class StatusesBody extends StatelessWidget {
  const StatusesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStatusCard(
            title: "My Status",
            subtitle: "tap to add status update",
            showAddIcon: true,
            onTap: () {},
          ),
          AppSizes.h10,
          const CustomStatusSectionText(text: 'Recent updates'),
          ...List.generate(
            3,
            (i) => CustomStatusCard(
              title: "Marwan Ali",
              subtitle: "Today, 12:00 PM",
              onTap: () {},
            ),
          ),
          AppSizes.h10,
          const CustomStatusSectionText(text: 'Viewed updates'),
          ...List.generate(
            3,
            (i) => CustomStatusCard(
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
