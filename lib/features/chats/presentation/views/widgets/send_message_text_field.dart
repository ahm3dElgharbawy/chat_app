import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomSendMessageTextField extends StatelessWidget {
  const CustomSendMessageTextField(
      {super.key,
      this.onChanged,
      required this.onPickFile,
      required this.onPickImageFromCamera,
      required this.controller});

  final void Function(String)? onChanged;
  final VoidCallback onPickFile;
  final VoidCallback onPickImageFromCamera;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        maxLines: 5,
        minLines: 1,
        controller: controller,
        onChanged: onChanged,
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
                onTap: onPickFile,
              ),
              Visibility(
                visible: controller.text.trim().isEmpty,
                child: CustomIconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.grey,
                    size: 24.r,
                  ),
                  onTap: onPickImageFromCamera,
                ),
              ),
              SizedBox(width: 5.w)
            ],
          ),
        ),
      ),
    );
  }
}
