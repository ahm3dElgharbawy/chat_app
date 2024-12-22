part of 'group_cubit.dart';

sealed class GroupState {}

final class GroupInitial extends GroupState {}

final class GetGroupMembersLoading extends GroupState {}

final class GetGroupMembersSuccess extends GroupState {}

final class GetGroupMembersFailure extends GroupState {
  final String message;
  GetGroupMembersFailure({required this.message});
}


final class CreateGroupLoading extends GroupState {}

final class CreateGroupSuccess extends GroupState {}

final class CreateGroupFailure extends GroupState {
  final String message;
  CreateGroupFailure({required this.message});
}

final class AddGroupMemberLoading extends GroupState {}

final class AddGroupMemberSuccess extends GroupState {}

final class AddGroupMemberFailure extends GroupState {
  final String message;
  AddGroupMemberFailure({required this.message});
}

final class RemoveGroupMemberLoading extends GroupState {}

final class RemoveGroupMemberSuccess extends GroupState {}

final class RemoveGroupMemberFailure extends GroupState {
  final String message;
  RemoveGroupMemberFailure({required this.message});
}

