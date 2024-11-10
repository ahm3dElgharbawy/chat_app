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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> registerUser(AppUser userData);
  Future<Either<Failure, User>> loginUser(String email, String password);
  Future storeUserDataInFirestore(AppUser user); // add user to firestore
  Future cacheUserData(AppUser user); //
  Future<AppUser> getUserDataFromFirestore(String uid);
}

class AuthRepoImpl extends AuthRepo {
  final DatabaseService databaseService;
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final authUser = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      final user = await getUserDataFromFirestore(authUser.uid);
      await cacheUserData(user);
      return right(authUser);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return left(
        const ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, User>> registerUser(userData) async {
    User? authUser;
    try {
      authUser = await firebaseAuthService.createUserWithEmailAndPassword(
          userData.email, userData.password);
      await storeUserDataInFirestore(
        userData.copyWith(
          id: authUser.uid,
        ),
      );
      return right(authUser);
    } on CustomException catch (e) {
      deleteUser(authUser);
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(authUser);
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return left(
        const ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future storeUserDataInFirestore(AppUser user) async {
    // store user in the firestore
    await databaseService.addData(
      path: EndPoints.usersCollection,
      data: user.toJson(),
      documentId: user.id,
    );
  }

  @override
  Future<AppUser> getUserDataFromFirestore(String uid) async {
    final userData = await databaseService.getData(
        path: EndPoints.usersCollection, documentId: uid);
    return AppUser.fromJson(userData);
  }

  @override
  Future cacheUserData(AppUser user) async {
    await Prefs.setString(kAppUser, jsonEncode(user.toJson()));
  }

}
