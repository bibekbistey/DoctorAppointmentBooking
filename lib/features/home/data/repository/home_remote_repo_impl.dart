import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';

import '../../domain/entity/home_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_remote_data_source.dart';

final homeRemoteRepoProvider = Provider<IHomeRepository>(
  (ref) => HomeRemoteRepositoryImpl(
    homeRemoteDataSource: ref.read(homeRemoteDataSourceProvider),
  ),
);

class HomeRemoteRepositoryImpl implements IHomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRemoteRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addDoctor(HomeEntity doctor) {
    return homeRemoteDataSource.addDoctor(doctor);
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDoctors() {
    return homeRemoteDataSource.getAllDoctors();
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDoctorList() {
    return homeRemoteDataSource.getAllDoctorList();
  }

  @override
  Future<Either<Failure, bool>> approveDoctor(String userId,String status) {
    return homeRemoteDataSource.approveDoctor(userId,status);
  }

   @override
  Future<Either<Failure, bool>> deleteDoctor(String id) {
    return homeRemoteDataSource.deleteDoctor(id);
  }

  // @override
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByHome(
  //     String homeId) {
  //   return homeRemoteDataSource.getAllStudentsByHome(homeId);
  // }

  // @override
  // Future<Either<Failure, bool>> deleteDoctor(String id) {
  //   return homeRemoteDataSource.deleteDoctor(id);
  // }
}
