import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/core/constants/endpoints.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/core/errors/failures.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/core/services/shared_prefs_singleton.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      final query = await FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .doc(user.id)
          .collection(EndPoints.chatsCollection)
          .get();
      final chats =
          query.docs.map((doc) => ChatModel.fromJson(doc.data())).toList();
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
