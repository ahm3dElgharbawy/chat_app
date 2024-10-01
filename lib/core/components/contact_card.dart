import 'package:chat_app/core/components/circular_image.dart';
import 'package:chat_app/core/components/delivery_seen_status.dart';
import 'package:chat_app/core/components/message_type_with_icon.dart';
import 'package:chat_app/core/components/read_unread_time.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomContactCard extends StatelessWidget {
  const CustomContactCard({
    super.key,
    required this.image,
    required this.lastMessageType,
    this.text,
    required this.seenStatus,
    required this.userName,
    required this.time,
    required this.unReadCount,
    this.isLastMessageForMe = false,
  });
  final String userName;
  final String image;
  final MediaType lastMessageType;
  final SeenStatus seenStatus;
  final String time;
  final int unReadCount;
  final String? text;
  final bool isLastMessageForMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircularImage(image: image),
        AppSizes.w10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName,style: TextStyles.medium14),
            AppSizes.h5,
            isLastMessageForMe
                ? CustomDeliveredSeenStatus(
                    seenStatus: seenStatus,
                    mediaType: lastMessageType,
                    text: text,
                  )
                : CustomMessageTypeWithIcon(mediaType: lastMessageType,text: text)
          ],
        ),
        const Spacer(),
        CustomReadAndUnreadTime(unReadCount: unReadCount, time: time)
      ],
    );
  }
}
