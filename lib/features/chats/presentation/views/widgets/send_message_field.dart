import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
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
                  setState(() {
                    readyToSend = value.trim().isNotEmpty ? true : false;
                  });
                },
                style: TextStyles.regular14,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Message",
                  hintStyle: TextStyles.medium15.copyWith(color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 12.h),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 5.w),
                    child: CustomIconButton(
                      icon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                      onTap: () {},
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButton(
                        icon: Transform.rotate(
                          angle: 180,
                          child: Icon(
                            Icons.attachment_sharp,
                            color: Colors.grey,
                            size: 24.r,
                          ),
                        ),
                        onTap: () {},
                      ),
                      Visibility(
                        visible: !readyToSend,
                        child: CustomIconButton(
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.grey,
                            size: 24.r,
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 5.w)
                    ],
                  ),
                ),
              ),
            ),
            AppSizes.w5,
            CustomIconButton(
              onTap: () {},
              backgroundColor: AppColors.primary,
              icon: Icon(
                readyToSend ? Icons.send : Icons.keyboard_voice_rounded,
                size: 24.r,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
