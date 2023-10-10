import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/use_case/home_use_case.dart';
import '../state/home_state.dart';



final doctorListViewModelProvider =
    StateNotifierProvider<DoctorListViewModel, HomeState>(
  (ref) {
    return DoctorListViewModel(ref.read(homeUsecaseProvider));
  },
);

class DoctorListViewModel extends StateNotifier<HomeState> {
  final HomeUseCase homeUseCase;

  DoctorListViewModel(this.homeUseCase) : super(HomeState.initial()) {
    getAllDoctorList();
  }


  Future<void> deleteDoctor(BuildContext context, HomeEntity doctor) async {
    state.copyWith(isLoading: true);
    var data = await homeUseCase.deleteDoctor(doctor.userId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.doctors.remove(doctor);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Doctor deleted successfully',
          context: context,
        );
      },
    );
  }

  addDoctor(HomeEntity doctor) async {
    state.copyWith(isLoading: true);
    var data = await homeUseCase.addDoctor(doctor);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllDoctorList() async {
    state = state.copyWith(isLoading: true);
    var data = await homeUseCase.getAllDoctorList();
    state = state.copyWith(doctors: []);
    print(data);
    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, doctors: r, error: null),
    );
  }
}
