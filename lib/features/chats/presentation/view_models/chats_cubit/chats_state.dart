part of 'chats_cubit.dart';

sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

// get all my chats
final class GetChatsLoading extends ChatsState {}

final class GetChatsSuccess extends ChatsState {}

final class GetChatsFailure extends ChatsState {
  final String message;
  GetChatsFailure({required this.message});
}

// get chat messages
final class GetChatMessagesLoading extends ChatsState {}

final class GetChatMessagesSuccess extends ChatsState {}

final class GetChatMessagesFailure extends ChatsState {
  final String message;
  GetChatMessagesFailure({required this.message});
}

// send message
final class SendChatMessageLoading extends ChatsState {}

final class SendChatMessageSuccess extends ChatsState {}

final class SendChatMessageFailure extends ChatsState {
  final String message;
  SendChatMessageFailure({required this.message});
}

// fetch contacts
final class GetContactsLoading extends ChatsState {}

final class GetContactsSuccess extends ChatsState {}

final class GetContactsFailure extends ChatsState {
  final String message;
  GetContactsFailure({required this.message});
}
