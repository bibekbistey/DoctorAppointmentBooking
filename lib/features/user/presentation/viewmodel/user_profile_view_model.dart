import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/user_use_case.dart';
import '../state/user_state.dart';

final userProfileViewModelProvider = StateNotifierProvider<UserProfileViewModel, UserState>(
  (ref) => UserProfileViewModel(
    ref.watch(userUsecaseProvider),
  ),
);

class UserProfileViewModel extends StateNotifier<UserState> {
  final UserUseCase userUseCase;

  Future<void> deleteUser(BuildContext context, UserEntity user) async {
    state.copyWith(isLoading: true);
    var data = await userUseCase.deleteUser(user.userId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.users.remove(user);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'User deleted successfully',
          context: context,
        );
      },
    );
  }

  UserProfileViewModel(this.userUseCase) : super(UserState.initial()) {
    getUserInfo();
  }
  

  getUserInfo() async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.getUserInfo();


    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, users: r, error: null),
    );
  }

  editProfile(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.editProfile(user);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  


}











