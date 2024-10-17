import 'package:chat_app/core/common_widgets/delivery_seen_status.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomMessageBody extends StatelessWidget {
  const CustomMessageBody({
    super.key,
    required this.isMe,
    required this.message,
    required this.time,
  }); //? later i will pass the message model here....
  final bool isMe;
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          constraints: BoxConstraints(maxWidth: context.screenWidth * .7),
          margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
          decoration: BoxDecoration(
            color: isMe ? AppColors.primary.withOpacity(.3) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //? message
              ReadMoreText(
                message,
                trimMode: TrimMode.Line,
                trimLines: 8,
                moreStyle: TextStyles.semibold28.copyWith(color: AppColors.primary),
                trimExpandedText: "",
                trimCollapsedText: "Read more",
              ),
              AppSizes.h5,
              //? time of sending or received & seen status
              CustomDeliveredSeenStatus(
                seenStatus: isMe ? SeenStatus.read : null,
                mediaType: MediaType.text,
                text: time,
              )
            ],
          ),
        ),
      ],
    );
  }
}
