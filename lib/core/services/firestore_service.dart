import 'dart:developer';
import 'dart:io';
import 'dart:math' show Random;

import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<String> uploadFile(File file,
      {String path = "uploads", String? name}) async {
    try {
      String fileExtension = file.path.split('.').last;
      // Get the file name
      String fileName = "${name ?? generateUniqueId()}.$fileExtension";

      // Define the storage bucket and file path
      const bucketName = 'chat_storage';
      final filePath = '$path/$fileName';

      // Upload the file
      await Supabase.instance.client.storage.from(bucketName).upload(
            filePath,
            file,
            fileOptions: const FileOptions(upsert: true),
          );

      // Generate the public URL
      final fileUrl = Supabase.instance.client.storage
          .from(bucketName)
          .getPublicUrl(filePath);

      return fileUrl;
    } on SocketException catch (_) {
      throw (CustomException(message: "check your internet connection"));
    } catch (e) {
      log("Exception in $runtimeType.uploadFile: ${e.toString()}");
      throw (CustomException(message: e.toString()));
    }
  }

  String generateUniqueId() {
    var rng = Random();
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var randomValue = rng.nextInt(1000000).toString();

    // Combine timestamp and random value to create a unique string
    return '$timestamp-$randomValue';
  }
}
