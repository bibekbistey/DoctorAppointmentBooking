import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/doctor_entity.dart';
import '../../domain/use_case/doctor_use_case.dart';
import '../state/doctor_state.dart';

final doctorViewModelProvider =
    StateNotifierProvider<DoctorViewModel, DoctorState>(
  (ref) {
    return DoctorViewModel(ref.read(doctorUsecaseProvider));
  },
);

class DoctorViewModel extends StateNotifier<DoctorState> {
  final DoctorUseCase doctorUseCase;

  DoctorViewModel(this.doctorUseCase) : super(DoctorState.initial()) {
    // getAllDoctores();
  }

  addDoctor(DoctorEntity doctor) async {
    state.copyWith(isLoading: true);
    var data = await doctorUseCase.addDoctor(doctor);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  // getAllDoctores() async {
  //   state = state.copyWith(isLoading: true);
  //   var data = await doctorUseCase.getAllDoctores();
  //   state = state.copyWith(doctors: []);

  //   data.fold(
  //     (l) => state = state.copyWith(isLoading: false, error: l.error),
  //     (r) => state = state.copyWith(isLoading: false, doctors: r, error: null),
  //   );
  // }
}
