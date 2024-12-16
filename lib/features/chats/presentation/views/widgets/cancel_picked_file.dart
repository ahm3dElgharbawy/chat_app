import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CancelPickedFileWidget extends StatelessWidget {
  const CancelPickedFileWidget({super.key, required this.onCancel});
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.darkThree,
        borderRadius: BorderRadius.circular(
          20.h,
        ),
      ),
      padding: EdgeInsetsDirectional.only(start: 15.w),
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.file_present_rounded, color: Colors.white),
          CustomIconButton(
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onTap: onCancel)
        ],
      ),
    );
  }
}
