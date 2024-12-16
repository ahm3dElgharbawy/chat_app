
import 'package:chat_app/core/common_widgets/delivery_seen_status.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/helpers/helper_functions.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chats/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
  }); //? later i will pass the message model here....
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          constraints: BoxConstraints(maxWidth: context.screenWidth * .7),
          margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems.h),
          decoration: BoxDecoration(
            color:
                message.isMe ? AppColors.primary.withOpacity(.3) : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //? message
              if (message.file != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Image.asset(
                    getMediaImagePlaceHolder(message.file!),
                    height: 100.h,
                  ),
                ),
              if (message.message != null)
                ReadMoreText(
                  message.message!,
                  style: TextStyles.regular14,
                  trimMode: TrimMode.Line,
                  trimLines: 8,
                  moreStyle:
                      TextStyles.semibold14.copyWith(color: AppColors.primary),
                  trimExpandedText: "",
                  trimCollapsedText: "Read more",
                ),
              AppSizes.h5,
              //? time of sending or received & seen status
              CustomDeliveredSeenStatus(
                seenStatus: message.isMe ? SeenStatus.read : null,
                mediaType: MediaType.text,
                text: DateFormat("hh:mm a").format(message.createdAt),
              )
            ],
          ),
        ),
      ],
    );
  }

  String getMediaImagePlaceHolder(String url) {
    switch (getMediaType(url: url)) {
      case MediaType.audio:
        return ImageStrings.audio;
      case MediaType.video:
        return ImageStrings.video;
      default:
        return ImageStrings.image;
    }
  }
}
