import 'dart:convert';

import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/services/shared_prefs_singleton.dart';

class AppUser {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String avatar;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.avatar = ImageStrings.userNetworkImage,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "avatar": avatar,
      };
  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? avatar,
  }) =>
      AppUser(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
      );

  static AppUser getFromCache() {
    final userAsJson = jsonDecode(Prefs.getString(kAppUser)!);
    return AppUser.fromJson(userAsJson);
  }
}
