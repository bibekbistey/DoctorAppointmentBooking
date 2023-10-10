import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/appointment_entity.dart';
import '../../domain/use_case/appointment_use_case.dart';
import '../state/appointment_state.dart';

final appointmentViewModelProvider =
    StateNotifierProvider<AppointmentViewModel, AppointmentState>(
  (ref) {
    return AppointmentViewModel(ref.read(appointmentUsecaseProvider));
  },
);

class AppointmentViewModel extends StateNotifier<AppointmentState> {
  final AppointmentUseCase appointmentUseCase;
  AppointmentViewModel(this.appointmentUseCase) : super(AppointmentState.initial()) {
    getAppointments();
  }

  

  addAppointment(AppointmentEntity appointment) async {
    state.copyWith(isLoading: true);
    var data = await appointmentUseCase.addAppointment(appointment);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAppointments() async {
    state = state.copyWith(isLoading: true);
    var data = await appointmentUseCase.getAppointments();
    state = state.copyWith(appointments: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state =
          state.copyWith(isLoading: false, appointments: r, error: null),
    );
  }
}
