import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';

import '../../data/repository/appointment_remote_repo_impl.dart';
import '../entity/appointment_entity.dart';

final appointmentRepositoryProvider = Provider<IAppointmentRepository>(
  (ref) {
    // return ref.watch(appointmentLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    return ref.watch(appointmentRemoteRepoProvider);

    // if (ConnectivityStatus.isConnected == internetStatus) {
    //   // If internet is available then return remote repo
    //   return ref.watch(appointmentRemoteRepoProvider);
    // } else {
    //   // If internet is not available then return local repo
    //   return ref.watch(appointmentLocalRepoProvider);
    // }
  },
);

abstract class IAppointmentRepository {
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments();
  Future<Either<Failure, bool>> addAppointment(AppointmentEntity appointment);
}
