import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_app_bar.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/message_body.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/send_message_field.dart';
import 'package:flutter/material.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Scaffold(
      appBar: const CustomChatAppbar(
        username: "Ahmed elsafy",
        image: ImageStrings.user,
      ),
      backgroundColor: const Color(0xffece6df),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // messages
            ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: const [
                CustomMessageBody(
                  message:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  isMe: false,
                  time: "10:20",
                ),
                CustomMessageBody(
                  message:
                      "ok thank you very much.",
                  isMe: true,
                  time: "11:30",
                ),
              ],
            ),
            // send text field
            CustomSendMessageField(messageController: messageController)
          ],
        ),
      ),
    );
  }
}
