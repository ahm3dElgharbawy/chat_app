import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/core/constants/endpoints.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/core/errors/failures.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/services/shared_prefs_singleton.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class GroupRepo {
  Future<Either<Failure, void>> createGroup(
      String groupName, List<String> membersIds);
  Future<Either<Failure, void>> addMembers(String groupId, List<String> membersIds);
  Future<Either<Failure, void>> removeMember(String groupId, String userId);
  Future<Either<Failure, List<AppUser>>> getGroupMembers(List<String> membersIds);
}

class GroupRepoImpl extends GroupRepo {
  final DatabaseService databaseService;
  GroupRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> createGroup(
      String groupName, List<String> membersIds) async {
    try {
      await databaseService.addData(path: EndPoints.groupsCollection, data: {
        'name': groupName,
        'members': membersIds,
        'avatar' : "https://cdn-icons-png.flaticon.com/512/1239/1239719.png",
        'created_at': FieldValue.serverTimestamp()
      });
      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in $runtimeType.createGroup: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addMembers(String groupId, List<String> membersIds) async {
    try {
      DocumentReference group = FirebaseFirestore.instance
          .collection(EndPoints.groupsCollection)
          .doc(groupId);
      await group.update({
        'members': FieldValue.arrayUnion(membersIds)
      });
      return right(unit);
    } catch (e) {
      log('Exception in $runtimeType.addMembers: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeMember(String groupId, String userId) async {
    try {
      DocumentReference group = FirebaseFirestore.instance
          .collection(EndPoints.groupsCollection)
          .doc(groupId);
      await group.update({
        'members': FieldValue.arrayRemove([userId])
      });
      return right(unit);
    } catch (e) {
      log('Exception in $runtimeType.removeMember: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<AppUser>>> getGroupMembers(List<String> membersIds)async {
    try {
      final snapShot = await FirebaseFirestore.instance
          .collection(EndPoints.usersCollection)
          .where('id',whereIn: membersIds)
          .get();
      return right(snapShot.docs.map((doc) => AppUser.fromJson(doc.data())).toList());
    } catch (e) {
      log('Exception in $runtimeType.getGroupMembers: ${e.toString()}');
      return left(
        const ServerFailure(
          'something went wrong, please try again later',
        ),
      );
    }
  }
}
