import 'dart:math';

import 'package:chat_app/core/enums/media_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

MediaType getMediaType({required String url}) {
  String extension = url.split(".").last;
  if (["mp3", 'm4a'].contains(extension)) {
    return MediaType.audio;
  } else if (extension == "mp4") {
    return MediaType.video;
  } else if (['jpeg', 'jpg', 'png', 'gif'].contains(extension)) {
    return MediaType.photo;
  }
  return MediaType.other;
}

void launchURLFunction(String url) async {
  final Uri parsedUri = Uri.parse(url);
  if (!await launchUrl(parsedUri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $parsedUri');
  }
}

Color getRandomColor(dynamic userId) {
  // Hash the user ID for consistent results
  final int hash = userId.hashCode;
  final Random random = Random(hash);

  // Generate colors in the green/teal/blue range
  int red = random.nextInt(50); 
  int green = 150 + random.nextInt(106); 
  int blue = 100 + random.nextInt(156); 

  return Color.fromRGBO(red, green, blue, 1.0);
}
