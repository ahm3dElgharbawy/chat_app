import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/components/chat_tab.dart';
import 'package:chat_app/core/components/circular_container.dart';
import 'package:chat_app/core/components/contact_card.dart';
import 'package:chat_app/core/components/delivery_seen_status.dart';
import 'package:chat_app/core/components/message_type_with_icon.dart';
import 'package:chat_app/core/components/read_unread_time.dart';
import 'package:chat_app/core/common_widgets/text_fields/text_field.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/themes/custom_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';

class AllComponentsScreen extends StatelessWidget {
  const AllComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomTextField(
                hint: "enter your name",
                label: "User Name",
              ),
              AppSizes.h10,
              CustomElevatedButton(
                title: "Submit",
                onTap: () {},
              ),
              AppSizes.h10,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const CustomChatTab(
                      tabTitle: "Stories",
                    ),
                    AppSizes.w10,
                    const CustomChatTab(
                      tabTitle: "Stories",
                      unReadCount: 5,
                    ),
                    AppSizes.w10,
                    const CustomChatTab(
                      tabTitle: "Stories",
                      active: false,
                      unReadCount: 5,
                    ),
                  ],
                ),
              ),
              AppSizes.h10,
              const CustomMessageTypeWithIcon(mediaType: MediaType.photo),
              const CustomMessageTypeWithIcon(mediaType: MediaType.sticker),
              const CustomMessageTypeWithIcon(mediaType: MediaType.video),
              const CustomMessageTypeWithIcon(mediaType: MediaType.audio),
              AppSizes.h10,
              const CustomReadAndUnreadTime(unReadCount: 5, time: "10:22 PM"),
              AppSizes.h10,
              const CustomReadAndUnreadTime(unReadCount: 0, time: "10:10 PM"),
              AppSizes.h10,
              const CustomDeliveredSeenStatus(
                seenStatus: SeenStatus.read,
                mediaType: MediaType.video,
                text: "hello there",
              ),
              const CustomDeliveredSeenStatus(
                seenStatus: SeenStatus.delivered,
                mediaType: MediaType.photo,
                text: "hello there",
              ),
              const CustomDeliveredSeenStatus(
                seenStatus: SeenStatus.sent,
                mediaType: MediaType.audio,
                text: "hello there",
              ),
              AppSizes.h10,
              const CustomContactCard(
                image: ImageStrings.user,
                lastMessageType: MediaType.photo,
                seenStatus: SeenStatus.read,
                userName: "Dianne Russell",
                time: "12:00 Am",
                unReadCount: 5,
              ),
              AppSizes.h10,
              const CustomContactCard(
                image: ImageStrings.user,
                lastMessageType: MediaType.text,
                seenStatus: SeenStatus.read,
                userName: "Dianne Russell",
                time: "12:00 Am",
                text: "hello there",
                unReadCount: 0,
              ),
              AppSizes.h10,
              const CustomContactCard(
                image: ImageStrings.user,
                lastMessageType: MediaType.video,
                seenStatus: SeenStatus.read,
                userName: "Dianne Russell",
                time: "10:00 Am",
                text: "hello there",
                unReadCount: 0,
                isLastMessageForMe: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ❤
