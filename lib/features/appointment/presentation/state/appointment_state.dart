import '../../domain/entity/appointment_entity.dart';

class AppointmentState {
  final bool isLoading;
  final List<AppointmentEntity> appointments;

  final String? error;

  AppointmentState({
    required this.isLoading,
    required this.appointments,
    this.error,
  });

  factory AppointmentState.initial() {
    return AppointmentState(
      isLoading: false,
      appointments: [],
    );
  }

  AppointmentState copyWith({
    bool? isLoading,
    List<AppointmentEntity>? appointments,
    String? error,
  }) {
    return AppointmentState(
      isLoading: isLoading ?? this.isLoading,
      appointments: appointments ?? this.appointments,
      error: error ?? this.error,
    );
  }
}
