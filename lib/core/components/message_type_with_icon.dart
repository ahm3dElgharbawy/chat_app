import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:flutter/material.dart';

class CustomMessageTypeWithIcon extends StatelessWidget {
  const CustomMessageTypeWithIcon({super.key, required this.mediaType, this.text});
  final MediaType mediaType;
  final String? text;

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    switch (mediaType) {
      case MediaType.video:
        return Row(
          children: [
            Icon(
              Icons.videocam_outlined,
              size: iconSize,
              color: Colors.grey[700],
            ),
            AppSizes.w6,
            const Text("Video")
          ],
        );
      case MediaType.audio:
        return Row(
          children: [
            Icon(
              Icons.keyboard_voice_outlined,
              size: iconSize,
              color: Colors.grey[700],
            ),
            AppSizes.w6,
            const Text("Audio")
          ],
        );
      case MediaType.sticker:
        return Row(
          children: [
            Icon(
              Icons.emoji_emotions_outlined,
              size: iconSize,
              color: Colors.grey[700],
            ),
            AppSizes.w6,
            const Text("Sticker")
          ],
        );
      case MediaType.photo:
        return Row(
          children: [
            Icon(
              Icons.image_outlined,
              size: iconSize,
              color: Colors.grey[700],
            ),
            AppSizes.w6,
            const Text("Photo")
          ],
        );
      default:
        return Text(text.toString());
    }
  }
}
