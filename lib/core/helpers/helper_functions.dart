import 'package:chat_app/core/enums/media_type.dart';

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
