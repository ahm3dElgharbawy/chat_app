import 'dart:async';

import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/chat.dart';
import 'package:chat_app/features/chats/data/models/message.dart';
import 'package:chat_app/features/chats/data/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.chatRepo) : super(ChatsInitial());
  final ChatRepo chatRepo;
  List<ChatModel> chats = [];
  StreamSubscription? chatsStreamSubscription;

  void fetchChats() async {
    emit(GetChatsLoading());
    chatsStreamSubscription?.cancel(); // cancel old stream to prevent stream collision
    final result = await chatRepo.getChats();
    result.fold(
      (failure) => emit(GetChatsFailure(message: failure.message)),
      (chatsStream) {
        chatsStreamSubscription = chatsStream.listen((event) async {
          chats = await event;
          print(chats);
          emit(GetChatsSuccess());
        });
      },
    );
  }

  List<MessageModel> messages = [];
  StreamSubscription? messagesStreamSubscription;
  void getChatMessages(String otherUserId) async {
    emit(GetChatMessagesLoading());
    messagesStreamSubscription?.cancel();
    final result = await chatRepo.getChatMessages(receiverId: otherUserId);
    result.fold(
      (failure) => emit(GetChatMessagesFailure(message: failure.message)),
      (stream) {
        messagesStreamSubscription = stream.listen(
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
    final result =
        await chatRepo.sendMessage(otherUserId, message, messages.isEmpty);
    result.fold(
      (failure) => emit(SendChatMessageFailure(message: failure.message)),
      (_) => emit(SendChatMessageSuccess()),
    );
  }

  List<AppUser> contacts = [];
  void getContacts() async {
    emit(GetContactsLoading());
    final result = await chatRepo.getContacts();
    result.fold(
      (failure) => emit(GetContactsFailure(message: failure.message)),
      (c) {
        contacts = c;
        emit(GetContactsSuccess());
      },
    );
  }
}
