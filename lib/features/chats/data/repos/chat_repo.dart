import 'dart:developer';
import 'dart:io';

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
  Future<Either<Failure, Stream<Future<List<ChatModel>>>>> getChats();
  Future<Either<Failure, List<AppUser>>> getContacts();
  Future<Either<Failure, Stream<List<MessageModel>>>> getChatMessages(
      {required String receiverId});
  Future<Either<Failure, void>> sendMessage(
      String receiverId, Map<String, dynamic> message, bool isFirst);
}

class ChatRepoImpl extends ChatRepo {
  final DatabaseService databaseService;
  ChatRepoImpl({required this.databaseService});
  AppUser get currentUser => AppUser.getFromCache();

  @override
  Future<Either<Failure, Stream<Future<List<ChatModel>>>>> getChats() async {
    try {
      List<ChatModel> chats = [];
      final chatsCollection = FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .doc(currentUser.id)
          .collection(EndPoints.chatsCollection);
      final chatsStream = chatsCollection.snapshots().map((snapshot) async {
        chats.clear();
        for (var chatDocument in snapshot.docs) {
          // get chat user data
          final userData = await databaseService.getData(
              path: EndPoints.usersCollection, documentId: chatDocument.id);
          // get last message in the chat
          final lastMessage =
              await getLastMessage(chatsCollection, chatDocument.id);
          chats.add(
            ChatModel(
              id: chatDocument.id,
              lastMessage: MessageModel.fromJson(lastMessage, currentUser.id),
              isLastMessageByMe: lastMessage['sender_id'] == currentUser.id,
              date: lastMessage['created_at'].toDate(),
              userData: UserData.fromJson(userData),
            ),
          );
        }
        return chats;
      });

      return right(chatsStream);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in $runtimeType.getChats: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }

  Future<Map<String, dynamic>> getLastMessage(
      CollectionReference chatsCollection, String docId) async {
    final lastMessage = await chatsCollection
        .doc(docId)
        .collection(EndPoints.messagesCollection)
        .orderBy('created_at', descending: true)
        .limit(1)
        .get();
    return lastMessage.docs.first.data();
  }

  @override
  Future<Either<Failure, Stream<List<MessageModel>>>> getChatMessages(
      {required String receiverId}) async {
    return right(
      FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .doc(currentUser.id)
          .collection(EndPoints.chatsCollection)
          .doc(receiverId)
          .collection(EndPoints.messagesCollection)
          .orderBy('created_at')
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => MessageModel.fromJson(doc.data(), currentUser.id))
                .toList(),
          ),
    );
  }

  @override
  Future<Either<Failure, void>> sendMessage(
      String receiverId, Map<String, dynamic> message, bool isFirst) async {
    try {
      // upload the file if it's provided
      if (message['file'] != null) {
        message['file'] =
            await databaseService.uploadFile(message['file'] as File);
      }
      // store message in my chat messages collection
      final docRefMe = getMessageReference(currentUser.id, receiverId);
      message['id'] = docRefMe.id;
      docRefMe.set(message);
      // store message in receiver chat messages collection
      final docRefOther = getMessageReference(receiverId, currentUser.id);
      message['id'] = docRefOther.id;
      docRefOther.set(message);
      if (isFirst) {
        // insure that chat has the filed date when created to avoid empty QuerySnapShot when fetching chats
        await updateChatDate(receiverId);
      }
      return right(unit);
    } catch (e) {
      log('Exception in $runtimeType.getChats: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }

  DocumentReference getMessageReference(String senderId, String receiverId) {
    return FirebaseFirestore.instance
        .collection(EndPoints.usersCollection)
        .doc(senderId)
        .collection(EndPoints.chatsCollection)
        .doc(receiverId)
        .collection(EndPoints.messagesCollection)
        .doc();
  }

  @override
  Future<Either<Failure, List<AppUser>>> getContacts() async {
    try {
      final query = await FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .where('id', isNotEqualTo: currentUser.id)
          .get();
      return right(
          query.docs.map((doc) => AppUser.fromJson(doc.data())).toList());
    } catch (e) {
      log('Exception in $runtimeType.getContacts: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }

  Future<void> updateChatDate(String uid) async {
    try {
      final timestamp = FieldValue.serverTimestamp();
      await FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .doc(currentUser.id)
          .collection(EndPoints.chatsCollection)
          .doc(uid)
          .set({"date": timestamp});

      await FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .doc(uid)
          .collection(EndPoints.chatsCollection)
          .doc(currentUser.id)
          .set({"date": timestamp});
    } catch (e) {
      log('Exception in $runtimeType.updateChatDate: ${e.toString()}');
      rethrow;
    }
  }
}
