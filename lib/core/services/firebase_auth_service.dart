import 'dart:developer';

import 'package:chat_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;
  static Future<void> logout() => FirebaseAuth.instance.signOut();
  Future<void> deleteUser() => FirebaseAuth.instance.currentUser!.delete();

  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'email already exist, login now');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'please check your internet connection');
      } else {
        throw CustomException(
            message: 'something went wrong, please try again later');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          message: 'something went wrong, please try again later');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'user not found');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'email or password is not correct');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'email or password is not correct');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'please check your internet connection');
      } else {
        throw CustomException(
            message: 'something went wrong, please try again later');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'something went wrong, please try again later');
    }
  }
}
