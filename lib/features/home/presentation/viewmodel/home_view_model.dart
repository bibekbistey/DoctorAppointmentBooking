import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/home_entity.dart';
import '../../domain/use_case/home_use_case.dart';
import '../state/home_state.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    ref.watch(homeUsecaseProvider),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  final HomeUseCase homeUseCase;

  HomeViewModel(this.homeUseCase) : super(HomeState.initial()) {
    getAllDoctors();
  }


  Future<void> approveDoctor(BuildContext context, String userId, String status) async {
    state.copyWith(isLoading: true);
    var data = await homeUseCase.approveDoctor(userId, status);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        status='approved';
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Approved Doctor successfully',
          context: context,
        );
      },
    );
  }

  addDoctor(HomeEntity doctors) async {
    state.copyWith(isLoading: true);
    var data = await homeUseCase.addDoctor(doctors);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllDoctors() async {
    state = state.copyWith(isLoading: true);
    var data = await homeUseCase.getAllDoctors();
    state = state.copyWith(doctors: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, doctors: r, error: null),
    );
  }

}
// }