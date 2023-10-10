import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/appointment_entity.dart';
import '../../domain/repository/appointment_repository.dart';
import '../data_source/appointment_remote_data_source.dart';

final appointmentRemoteRepoProvider = Provider<IAppointmentRepository>(
  (ref) => AppointmentRemoteRepositoryImpl(
    appointmentRemoteDataSource: ref.read(appointmentRemoteDataSourceProvider),
  ),
);

class AppointmentRemoteRepositoryImpl implements IAppointmentRepository {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;

  AppointmentRemoteRepositoryImpl({required this.appointmentRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addAppointment(AppointmentEntity appointment) {
    return appointmentRemoteDataSource.addAppointment(appointment);
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments() {
    return appointmentRemoteDataSource.getAppointments();
  }
}
