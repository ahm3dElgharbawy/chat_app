import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomSendMessageField extends StatefulWidget {
  const CustomSendMessageField({super.key, required this.messageController});
  final TextEditingController messageController;
  @override
  State<CustomSendMessageField> createState() => _CustomSendMessageFieldState();
}

class _CustomSendMessageFieldState extends State<CustomSendMessageField> {
  bool readyToSend = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 5,
                minLines: 1,
                controller: widget.messageController,
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    setState(() {
                      readyToSend = true;
                    });
                  } else {
                    setState(() {
                      readyToSend = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  // fillColor: AppColors.white,
                  filled: true,
                  hintText: "Message",
                  hintStyle: TextStyles.medium30.copyWith(color: Colors.grey),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Transform.rotate(
                          angle: 180,
                          child: const Icon(
                            Icons.attachment_sharp,
                            color: Colors.grey,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              icon:
                  Icon(readyToSend ? Icons.send : Icons.keyboard_voice_rounded),
            )
          ],
        )
      ],
    );
  }
}
