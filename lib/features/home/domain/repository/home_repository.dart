import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/home_local_repo_impl.dart';
import '../../data/repository/home_remote_repo_impl.dart';
import '../entity/home_entity.dart';

final homeRepositoryProvider = Provider<IHomeRepository>(
  (ref) {
    // return ref.watch(homeLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(homeRemoteRepoProvider);
    } else {
      // If internet is not available then return local repo
      return ref.watch(homeLocalRepoProvider);
    }

    // return ref.watch(homeRemoteRepoProvider);
  },
);

abstract class IHomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getAllDoctors();
  Future<Either<Failure, List<HomeEntity>>> getAllDoctorList();
  Future<Either<Failure, bool>> addDoctor(HomeEntity doctor);
  Future<Either<Failure, bool>> approveDoctor(String userId,String status);
  Future<Either<Failure, bool>> deleteDoctor(String id);
  
  // Future<Either<Failure, bool>> deleteDoctor(String id);
}
