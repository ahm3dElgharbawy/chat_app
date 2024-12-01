import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/message.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final MessageModel lastMessage;
  final bool isLastMessageByMe;
  final DateTime date;
  final UserData userData;

  ChatModel({
    required this.id,
    required this.lastMessage,
    required this.isLastMessageByMe,
    required this.date,
    required this.userData
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      lastMessage: MessageModel.fromJson(json['last_message']),
      isLastMessageByMe: json['last_sender_id'] == AppUser.getFromCache().id,
      date: json['created_at'] as DateTime,
      userData: json['user']
    );
  }
}
