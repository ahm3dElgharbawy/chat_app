import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/user_contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBody extends StatelessWidget {
  const ContactsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if(state is GetContactsLoading){
          return const CustomLoadingWidget();
        }
        return ListView(
          children: context
              .read<ChatsCubit>()
              .contacts
              .map((user) => UserContactCard(user: user))
              .toList(),
        );
      },
    );
  }
}
