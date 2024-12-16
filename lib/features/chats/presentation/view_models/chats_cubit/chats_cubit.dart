import 'dart:async';

import 'package:chat_app/features/chats/data/models/chat.dart';
import 'package:chat_app/features/chats/data/models/message.dart';
import 'package:chat_app/features/chats/data/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.chatRepo) : super(ChatsInitial());
  final ChatRepo chatRepo;
  List<ChatModel> chats = [];
  void fetchChats() async {
    emit(GetChatsLoading());
    final result = await chatRepo.getChats();
    result.fold(
      (failure) => emit(GetChatsFailure(message: failure.message)),
      (chats) {
        this.chats = chats;
        emit(GetChatsSuccess());
      },
    );
  }

  List<MessageModel> messages = [];
  StreamSubscription? streamSubscription;
  void getChatMessages(String otherUserId) async {
    emit(GetChatMessagesLoading());
    streamSubscription
        ?.cancel(); // cancel old stream to prevent stream collision
    final result = await chatRepo.getChatMessages(receiverId: otherUserId);
    result.fold(
      (failure) => emit(GetChatMessagesFailure(message: failure.message)),
      (stream) {
        streamSubscription = stream.listen(
          (allMessages) {
            messages = allMessages;
            emit(GetChatMessagesSuccess());
          },
          onError: (error) =>
              emit(GetChatMessagesFailure(message: "stream has error")),
        );
      },
    );
  }

  void sendMessage(String otherUserId, Map<String, dynamic> message) async {
    emit(SendChatMessageLoading());
    final result = await chatRepo.sendMessage(otherUserId, message);
    result.fold(
      (failure) => emit(SendChatMessageFailure(message: failure.message)),
      (_) => emit(SendChatMessageSuccess()),
    );
  }
}
