class MessageModel {
  final String id;
  final String? message;
  final String? file;
  final bool isMe;
  final DateTime createdAt;

  MessageModel({
    required this.id,
    required this.message,
    required this.file,
    required this.isMe,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json, String myId) =>
      MessageModel(
        id: json["id"],
        message: json["message"],
        file: json["file"],
        isMe: json['sender_id'] == myId ? true : false,
        createdAt: json["created_at"].toDate(),
      );
}
