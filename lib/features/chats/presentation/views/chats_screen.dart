import 'package:chat_app/core/common_widgets/contact_card.dart';
import 'package:chat_app/core/common_widgets/main_appbar.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> chats = [
      {"username": "Rowan", "lastMessage": "ok"},
      {"username": "Mohab ali", "lastMessage": "hello there"},
      {"username": "Marwan ali", "lastMessage": "are you sure?"},
    ];
    return Scaffold(
      appBar: const MainAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => CustomContactCard(
          image: ImageStrings.user,
          lastMessageType: MediaType.text,
          seenStatus: SeenStatus.read,
          unReadCount: 2,
          time: "12:00 PM",
          isLastMessageForMe: false,
          userName: chats[i]['username'],
          text: chats[i]['lastMessage'], // required if last message is text
          onTap: () {
            context.pushNamed(AppRoutes.singleChat);
          },
        ),
        // separatorBuilder: (context, i) => AppSizes.h20,
        itemCount: 3,
      ),
    );
  }
}
