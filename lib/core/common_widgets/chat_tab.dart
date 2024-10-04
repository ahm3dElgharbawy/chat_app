import 'package:chat_app/core/common_widgets/circular_container.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomChatTab extends StatelessWidget {
  const CustomChatTab({
    super.key,
    this.unReadCount = 0,
    this.active = true,
    required this.tabTitle,
  });
  final int unReadCount;
  final String tabTitle;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 25,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tabTitle,
              style: TextStyles.medium14
                  .copyWith(color: active ? Colors.white : Colors.white60),
            ),
            Visibility(
              visible: unReadCount != 0,
              child: Row(
                children: [
                  AppSizes.w5,
                  CustomCircularContainer(
                    child: unReadCount.toString(),
                    color: active ? Colors.white : Colors.white60,
                    textColor: AppColors.primary,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
