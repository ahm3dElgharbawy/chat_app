import 'package:chat_app/features/chats/presentation/views/widgets/chats_body.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});
  static const routeName = "/chats";
  @override
  Widget build(BuildContext context) {
    return const ChatsBody();
  }

  // void getData() async {
  //   final user = AppUser.getFromCache();
  //   print(user.toJson());
  //   final data = await FirebaseFirestore.instance
  //       .collection(EndPoints.usersCollection)
  //       .doc("oeKDBrsgwShyDgw6BDGv93XnXM53").collection("chats")
  //       .get();
  //   print(data.size);
  // }
}
