import 'dart:io';

import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/cancel_picked_file.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/send_message_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class WriteMessageSection extends StatefulWidget {
  const WriteMessageSection({super.key, required this.isGroup});
  final bool isGroup;

  @override
  State<WriteMessageSection> createState() => _WriteMessageSectionState();
}

class _WriteMessageSectionState extends State<WriteMessageSection> {
  bool readyToSend = false;
  File? file;
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (file != null)
          CancelPickedFileWidget(onCancel: () {
            setState(() {
              file = null;
              if (messageController.text.isEmpty) {
                readyToSend = false;
              }
            });
          }),
        Row(
          children: [
            CustomSendMessageTextField(
              onPickFile: () {
                pickFile();
              },
              onPickImageFromCamera: () {
                pickImage();
              },
              onChanged: (value) {
                setState(() {
                  readyToSend = value.trim().isNotEmpty ? true : false;
                });
              },
              controller: messageController,
            ),
            AppSizes.w5,
            BlocConsumer<ChatsCubit, ChatsState>(
              listener: (context, state) {
                if (state is SendChatMessageSuccess) {
                  setState(() {
                    file = null;
                  });
                  messageController.clear();
                }
              },
              builder: (context, state) {
                return CustomIconButton(
                  onTap: state is SendChatMessageLoading
                      ? null
                      : () {
                          if (readyToSend) {
                            sendMessage();
                          }
                        },
                  backgroundColor: AppColors.primary,
                  icon: Icon(
                    readyToSend ? Icons.send : Icons.keyboard_voice_rounded,
                    size: 24.r,
                    color: Colors.white,
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        file = File(result.files.single.path!);
        readyToSend = true;
      });
    }
  }

  void pickImage() async {
    XFile? result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      setState(() {
        file = File(result.path);
        readyToSend = true;
      });
    }
  }

  void sendMessage() {
    final cubit = context.read<ChatsCubit>();
    final message = {
      "message":
          messageController.text.trim().isEmpty ? null : messageController.text,
      "file": file,
      "sender_id": AppUser.getFromCache().id,
      "created_at": Timestamp.now()
    };
    if (widget.isGroup) {
      cubit.sendGroupMessage(context.args().id, message);
    } else {
      cubit.sendMessage(context.args().id, message);
    }
  }
}
