import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_remote_data_source.dart';

final userRemoteRepoProvider = Provider<IUserRepository>(
  (ref) => UserRemoteRepositoryImpl(
    userRemoteDataSource: ref.read(userRemoteDataSourceProvider),
  ),
);

class UserRemoteRepositoryImpl implements IUserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRemoteRepositoryImpl({required this.userRemoteDataSource});

   @override
  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    return userRemoteDataSource.getUserInfo();
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() {
    return userRemoteDataSource.getAllUsers();
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) {
    return userRemoteDataSource.deleteUser(id);
  }

  @override
  Future<Either<Failure, bool>> editProfile(UserEntity user) {
    return userRemoteDataSource.editProfile(user);
  }

  // @override
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByUser(
  //     String userId) {
  //   return userRemoteDataSource.getAllStudentsByUser(userId);
  // }

  // @override
  // Future<Either<Failure, bool>> deleteDoctor(String id) {
  //   return userRemoteDataSource.deleteDoctor(id);
  // }
}
