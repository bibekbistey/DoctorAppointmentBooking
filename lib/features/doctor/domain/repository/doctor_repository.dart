import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/doctor_local_repo_impl.dart';
import '../../data/repository/doctor_remote_repo_impl.dart';
import '../entity/doctor_entity.dart';

final doctorRepositoryProvider = Provider<IDoctorRepository>(
  (ref) {
    // return ref.watch(doctorLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    return ref.watch(doctorRemoteRepoProvider);

    // if (ConnectivityStatus.isConnected == internetStatus) {
    //   // If internet is available then return remote repo
    //   return ref.watch(doctorRemoteRepoProvider);
    // } else {
    //   // If internet is not available then return local repo
    //   return ref.watch(doctorLocalRepoProvider);
    // }
  },
);

abstract class IDoctorRepository {
  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctores();
  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctorList();
  Future<Either<Failure, bool>> addDoctor(DoctorEntity doctor);
}
