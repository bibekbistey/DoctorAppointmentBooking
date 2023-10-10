import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/user_remote_repo_impl.dart';
import '../entity/user_entity.dart';

final userRepositoryProvider = Provider<IUserRepository>(
  (ref) {
    // return ref.watch(userLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    // if (ConnectivityStatus.isConnected == internetStatus) {
    //   // If internet is available then return remote repo
    //   return ref.watch(userRemoteRepoProvider);
    // } else {
    //   // If internet is not available then return local repo
    //   return ref.watch(userLocalRepoProvider);
    // }

    return ref.watch(userRemoteRepoProvider);
  },
);

abstract class IUserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, List<UserEntity>>> getUserInfo();
  Future<Either<Failure, bool>> deleteUser(String id);
  Future<Either<Failure, bool>> editProfile(UserEntity user);
  // Future<Either<Failure, bool>> deleteDoctor(String id);
}
