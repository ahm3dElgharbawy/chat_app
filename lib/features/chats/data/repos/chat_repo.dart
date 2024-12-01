import 'dart:developer';

import 'package:chat_app/core/constants/endpoints.dart';
import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/core/errors/failures.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/chat.dart';
import 'package:chat_app/features/chats/data/models/message.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<ChatModel>>> getChats();
}

class ChatRepoImpl extends ChatRepo {
  final DatabaseService databaseService;
  ChatRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ChatModel>>> getChats() async {
    try {
      final user = AppUser.getFromCache();
      List<ChatModel> chats = [];
      final chatsCollection = FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .doc(user.id)
          .collection(EndPoints.chatsCollection);
      final chatDocs = await chatsCollection.get();
      for (var doc in chatDocs.docs) {
        // get chat user data
        final userData = await databaseService.getData(
            path: EndPoints.usersCollection, documentId: doc.id);
        // get last message in the chat
        final lastMessage = await chatsCollection
            .doc(doc.id)
            .collection("messages")
            .orderBy('created_at', descending: true)
            .limit(1)
            .get();
        final message = lastMessage.docs[0].data();
        chats.add(
          ChatModel(
            id: doc.id,
            lastMessage: MessageModel.fromJson(message),
            isLastMessageByMe: message['sender_id'] == user.id,
            date: message['created_at'].toDate(),
            userData: UserData.fromJson(userData),
          ),
        );
      }
      return right(chats);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ChatRepoImpl.getChats: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }
}
