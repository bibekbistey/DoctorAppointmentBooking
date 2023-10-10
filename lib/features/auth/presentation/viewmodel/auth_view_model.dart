import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/config/router/app_route.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/student_entity.dart';
import '../../domain/use_case/auth_usecase.dart';
import '../state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState.initial());

  Future<void> registerStudent(StudentEntity student) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerStudent(student);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => state = state.copyWith(
        isLoading: false,
        error: null,
      ),
    );
  }

  Future<void> loginStudent(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.loginStudent(email, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showSnackBar(
            message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        // Determine the user role and set it accordingly
        final userRole = success ? UserRole.admin : UserRole.user;
        state = state.copyWith(
          isLoading: false,
          error: null,
          userRole: userRole,
        );

        // Redirect to the appropriate page based on the user role
        // if (state.userRole == UserRole.admin) {
        //   Navigator.pushNamed(context, AppRoute.adminRoute);
        // } else {
        //   Navigator.popAndPushNamed(context, AppRoute.homeRoute);
        // }
      },
    );
  }
}

// class AuthViewModel extends StateNotifier<AuthState> {
//   final AuthUseCase _authUseCase;

//   AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false,isAdmin: false));

//   Future<void> registerStudent(StudentEntity student) async {
//     state = state.copyWith(isLoading: true);
//     var data = await _authUseCase.registerStudent(student);
//     data.fold(
//       (failure) => state = state.copyWith(
//         isLoading: false,
//         error: failure.error,
//       ),
//       (success) => state = state.copyWith(
//         isLoading: false,
//         error: null,
//       ),
//     );
//   }

//   Future<void> loginStudent(
//       BuildContext context, String email, String password) async {
//     state = state.copyWith(isLoading: true);
//     var data = await _authUseCase.loginStudent(email, password);
//     data.fold(
//       (failure) {
//         state = state.copyWith(isLoading: false, error: failure.error);
//         showSnackBar(
//             message: failure.error, context: context, color: Colors.red);
//       },
//       (success) {
//         // state = state.copyWith(isLoading: false, error: null,isAdmin:success.isAdmin);
//         // if(state.isAdmin){
//         //   Navigator.pushNamed(context, AppRoute.adminRoute);
//         // }else{
//         //   Navigator.pushNamed(context, AppRoute.homeRoute);
//         // }
//         //  checkAdminStatus();
//         Navigator.popAndPushNamed(context, AppRoute.homeRoute);
//       },
//     );
//   }



//   //  Future<void> checkAdminStatus() async {
//   //   state = state.copyWith(isLoading: true);
//   //   var data = await _authUseCase.checkAdminStatus();
//   //   data.fold(
//   //     (failure) {
//   //       state = state.copyWith(isLoading: false, error: failure.error);
//   //     },
//   //     (isAdmin) {
//   //       state = state.copyWith(isLoading: false, error: null, isAdmin: isAdmin);
//   //     },
//   //   );
// }

//   // Future<void> uploadImage(File file) async {
//   //   state = state.copyWith(isLoading: true);
//   //   var data = await _authUseCase.uploadProfilePicture(file);
//   //   data.fold(
//   //     (l) {
//   //       state = state.copyWith(isLoading: false, error: l.error);
//   //     },
//   //     (imageName) {
//   //       state =
//   //           state.copyWith(isLoading: false, error: null, imageName: imageName);
//   //     },
//   //   );
//   // }






