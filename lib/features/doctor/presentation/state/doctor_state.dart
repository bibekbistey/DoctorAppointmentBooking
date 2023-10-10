import '../../domain/entity/doctor_entity.dart';

class DoctorState {
  final bool isLoading;
  final List<DoctorEntity> doctors;

  final String? error;

  DoctorState({
    required this.isLoading,
    required this.doctors,
    this.error,
  });

  factory DoctorState.initial() {
    return DoctorState(
      isLoading: false,
      doctors: [],
    );
  }

  DoctorState copyWith({
    bool? isLoading,
    List<DoctorEntity>? doctors,
    String? error,
  }) {
    return DoctorState(
      isLoading: isLoading ?? this.isLoading,
      doctors: doctors ?? this.doctors,
      error: error ?? this.error,
    );
  }
}
