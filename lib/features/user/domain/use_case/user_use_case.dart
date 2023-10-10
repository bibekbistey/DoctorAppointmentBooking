import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

final userUsecaseProvider = Provider<UserUseCase>(
  (ref) => UserUseCase(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);

class UserUseCase {
  final IUserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<Either<Failure, List<UserEntity>>> getAllUsers() {
    return userRepository.getAllUsers();
  }

  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    return userRepository.getUserInfo();
  }

  Future<Either<Failure, bool>> deleteUser(String id) async {
    return userRepository.deleteUser(id);
  }

  Future<Either<Failure, bool>> editProfile(UserEntity user) {
    return userRepository.editProfile(user);
  }

}
