import 'package:chat_app/core/constants/image_strings.dart';

class UserData {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avatar;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar = ImageStrings.userNetworkImage,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
