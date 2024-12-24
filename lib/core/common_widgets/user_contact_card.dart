import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/chats/presentation/views/single_chat_screen.dart';
import 'package:flutter/material.dart';

class UserContactCard extends StatelessWidget {
  const UserContactCard({super.key, required this.user});
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        final userData = ChatHeader(id: user.id, name: user.name, email: user.email, phone: user.phone);
        context.pushReplacementNamed(SingleChatScreen.routeName,userData);
      },
      title: Text(user.name,style: TextStyles.semibold14), // here user name
      subtitle: Text(user.phone,style: TextStyles.regular12), // here user name
      leading: CustomCircularImage(image: user.avatar),
    );
  }
}