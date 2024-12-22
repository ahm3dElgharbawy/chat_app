import 'package:chat_app/core/constants/image_strings.dart';

class ChatHeader {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final String avatar;
  final List<String>? members;
  final bool isGroup;

  ChatHeader({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.isGroup = false,
    this.members,
    this.avatar = ImageStrings.userNetworkImage,
  });

  factory ChatHeader.fromJson(Map<String, dynamic> json) => ChatHeader(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "avatar": avatar,
      };
}
