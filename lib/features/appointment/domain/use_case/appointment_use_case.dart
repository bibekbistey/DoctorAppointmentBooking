import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/appointment_entity.dart';
import '../repository/appointment_repository.dart';

final appointmentUsecaseProvider = Provider<AppointmentUseCase>(
  (ref) => AppointmentUseCase(
    appointmentRepository: ref.watch(appointmentRepositoryProvider),
  ),
);

class AppointmentUseCase {
  final IAppointmentRepository appointmentRepository;

  AppointmentUseCase({required this.appointmentRepository});

  Future<Either<Failure, List<AppointmentEntity>>> getAppointments() {
    return appointmentRepository.getAppointments();
  }

  Future<Either<Failure, bool>> addAppointment(AppointmentEntity appointment) {
    return appointmentRepository.addAppointment(appointment);
  }
}
