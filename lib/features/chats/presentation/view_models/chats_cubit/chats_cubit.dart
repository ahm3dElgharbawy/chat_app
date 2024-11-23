import 'dart:developer';

import 'package:chat_app/features/chats/data/models/chat.dart';
import 'package:chat_app/features/chats/data/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.chatRepo) : super(ChatsInitial());
  final ChatRepo chatRepo;
  List<ChatModel> chats = [];
  fetchChats() async {
    emit(GetChatsLoading());
    final result = await chatRepo.getChats();
    log(chats.length.toString());
    result.fold(
      (failure) => emit(GetChatsFailure(message: failure.message)),
      (chats) {
        this.chats = chats;
        emit(GetChatsSuccess());
      },
    );
  }
}


// class ChatModel {
//   final String id;
//   final String lastSenderId;
//   final String lastMessage;
//   final DateTime date;

//   final 
// }