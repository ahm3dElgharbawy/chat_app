import 'package:chat_app/core/common_widgets/circular_container.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomReadAndUnreadTime extends StatelessWidget {
  const CustomReadAndUnreadTime({
    super.key,
    required this.unReadCount,
    required this.time,
  });
  final int unReadCount;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          time,
          style: TextStyles.regular28.copyWith(
            color: unReadCount == 0 ? Colors.black : AppColors.primary,
          ),
        ),
        Visibility(
          visible: unReadCount != 0,
          child: Column(
            children: [
              AppSizes.h5,
              CustomCircularContainer(child: unReadCount.toString()),
            ],
          ),
        )
      ],
    );
  }
}
