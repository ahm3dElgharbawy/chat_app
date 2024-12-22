import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/message.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';

class ChatModel {
  final String id;
  final MessageModel? lastMessage;
  final bool isLastMessageByMe;
  final DateTime date;
  final ChatHeader chatHeader;

  ChatModel({
    required this.id,
    required this.lastMessage,
    required this.isLastMessageByMe,
    required this.date,
    required this.chatHeader
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      lastMessage: MessageModel.fromJson(json['last_message'], AppUser.getFromCache().id),
      isLastMessageByMe: json['last_sender_id'] == AppUser.getFromCache().id,
      date: json['created_at'].toDate(),
      chatHeader: json['chat_header']
    );
  }
}
