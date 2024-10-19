import 'package:chat_app/core/common_widgets/message_type_with_icon.dart';
import 'package:chat_app/core/constants/icon_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDeliveredSeenStatus extends StatelessWidget {
  const CustomDeliveredSeenStatus({
    super.key,
    this.seenStatus,
    required this.mediaType,
    this.text,
  });
  final SeenStatus? seenStatus;
  final MediaType mediaType;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        getMessageType(mediaType),
        if (seenStatus != null) AppSizes.w5,
        if (seenStatus != null)
          SvgPicture.asset(
            getSeenStatusIcon(seenStatus!),
            width: 20,
          ),
      ],
    );
  }

  String getSeenStatusIcon(SeenStatus seenStatus) {
    switch (seenStatus) {
      case SeenStatus.sent:
        return IconStrings.messageSent;
      case SeenStatus.delivered:
        return IconStrings.messageDelivered;
      default:
        return IconStrings.messageRead;
    }
  }

  Widget getMessageType(MediaType mediaType) {
    if (mediaType == MediaType.text) {
      return CustomMessageTypeWithIcon(mediaType: MediaType.text, text: text);
    } else {
      return CustomMessageTypeWithIcon(mediaType: mediaType);
    }
  }
}
