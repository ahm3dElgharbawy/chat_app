import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_app_bar.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/message_body.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/send_message_field.dart';
import 'package:flutter/material.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});
static const routeName = "/singleChat";
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Scaffold(
      appBar: const CustomChatAppbar(
        username: "Ahmed Elsafy",
        image: ImageStrings.user,
      ),
      backgroundColor: const Color(0xffece6df),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace.r).copyWith(top: 0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // messages
            ListView(
              padding: EdgeInsets.only(
                bottom: 100.h,
                top: AppSizes.defaultSpace.r,
              ),
              children: const [
                CustomMessageBody(
                  message:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  isMe: false,
                  time: "10:20",
                ),
                CustomMessageBody(
                  message: "ok thank you very much.",
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
