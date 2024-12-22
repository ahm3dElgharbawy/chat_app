import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/groups/data/respos/group_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit(this.groupRepo) : super(GroupInitial());
  final GroupRepo groupRepo;
  List<AppUser> groupMembers = [];
  void fetchGroupMembers(List<String> membersIds) async {
    emit(GetGroupMembersLoading());
    final result = await groupRepo.getGroupMembers(membersIds);
    result.fold(
        (failure) => emit(GetGroupMembersFailure(message: failure.message)),
        (members) {
      groupMembers = members;
      emit(GetGroupMembersSuccess());
    });
  }

  void createGroup(String groupName, List<String> membersIds) async {
    emit(CreateGroupLoading());
    final result = await groupRepo.createGroup(groupName, membersIds);
    result.fold((failure) => emit(CreateGroupFailure(message: failure.message)),
        (_) {
      emit(CreateGroupSuccess());
    });
  }

  void addMember(String groupId, String memberId) async {
    emit(AddGroupMemberLoading());
    final result = await groupRepo.addMember(groupId, memberId);
    result.fold(
        (failure) => emit(AddGroupMemberFailure(message: failure.message)),
        (_) {
      emit(AddGroupMemberSuccess());
    });
  }

  void removeMember(String groupId, String memberId) async {
    emit(RemoveGroupMemberLoading());
    final result = await groupRepo.removeMember(groupId, memberId);
    result.fold(
        (failure) => emit(RemoveGroupMemberFailure(message: failure.message)),
        (_) {
      emit(RemoveGroupMemberSuccess());
    });
  }
}
