import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/user_use_case.dart';
import '../state/user_state.dart';

final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>(
  (ref) => UserViewModel(
    ref.watch(userUsecaseProvider),
  ),
);

class UserViewModel extends StateNotifier<UserState> {
  final UserUseCase userUseCase;

  UserViewModel(this.userUseCase) : super(UserState.initial()) {
    getAllUsers();
  }


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



  getUserInfo() async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.getUserInfo();
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, users: r, error: null),
    );
  }

  

  getAllUsers() async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.getAllUsers();
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, users: r, error: null),
    );
  }


}
// }










