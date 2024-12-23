import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace.r),
        child: Row(
          children: [
            const FittedBox(child: CustomLoadingWidget()),
            AppSizes.w15,
             Text("Please Wait ...",style: TextStyles.regular15,)
          ],
        ),
      ),
    );
  }
}
