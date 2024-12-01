class MessageModel {
  final String id;
  final String? message;
  final String? file;
  final String senderId;
  final DateTime createdAt;

  MessageModel({
    required this.id,
    required this.message,
    required this.file,
    required this.senderId,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        message: json["message"],
        file: json["file"],
        senderId: json['sender_id'],
        createdAt: json["created_at"].toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "file": file,
        "sender_id" : senderId,
        "created_at": createdAt,
      };
}
