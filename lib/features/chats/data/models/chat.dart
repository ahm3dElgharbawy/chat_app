import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final String lastMessage;
  final bool isLastMessageByMe;
  final DateTime date;

  ChatModel({
    required this.id,
    required this.lastMessage,
    required this.isLastMessageByMe,
    required this.date,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String,
      lastMessage: json['last_message'],
      isLastMessageByMe: json['last_sender_id'] == AppUser.getFromCache().id,
      date: (json['date'] as Timestamp).toDate(),
    );
  }
}
