import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/home_entity.dart';
import '../repository/home_repository.dart';

final homeUsecaseProvider = Provider<HomeUseCase>(
  (ref) => HomeUseCase(
    homeRepository: ref.watch(homeRepositoryProvider),
  ),
);

class HomeUseCase {
  final IHomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  Future<Either<Failure, List<HomeEntity>>> getAllDoctors() {
    return homeRepository.getAllDoctors();
  }

  Future<Either<Failure, bool>> addDoctor(HomeEntity home) {
    return homeRepository.addDoctor(home);
  }

   Future<Either<Failure, List<HomeEntity>>> getAllDoctorList() {
    return homeRepository.getAllDoctorList();
  }

  Future<Either<Failure, bool>> approveDoctor(String userId,String status) async {
    return homeRepository.approveDoctor(userId,status);
  }

  Future<Either<Failure, bool>> deleteDoctor(String id) async {
    return homeRepository.deleteDoctor(id);
  }

  // Future<Either<Failure, bool>> deleteBook(String id) async {
  //   return homeRepository.deleteBook(id);
  // }

  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByHome(
  //     String homeId) {
  //   return homeRepository.getAllStudentsByHome(homeId);
  // }
}
