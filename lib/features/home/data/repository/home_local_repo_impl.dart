import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/home_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_local_data_source.dart';

final homeLocalRepoProvider = Provider<IHomeRepository>((ref) {
  return HomeLocalRepositoryImpl(
    homeLocalDataSource: ref.read(homeLocalDataSourceProvider),
  );
});

class HomeLocalRepositoryImpl implements IHomeRepository {
  final HomeLocalDataSource homeLocalDataSource;

  HomeLocalRepositoryImpl({required this.homeLocalDataSource});
 
  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDoctors() {
    return homeLocalDataSource.getAllDoctors();
  }
  
  @override
  Future<Either<Failure, bool>> addDoctor(HomeEntity doctor) {
    // TODO: implement addDoctor
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> approveDoctor(String userId, String status) {
    // TODO: implement approveDoctor
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDoctorList() {
    // TODO: implement getAllDoctorList
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> deleteDoctor(String id) {
    // TODO: implement deleteDoctor
    throw UnimplementedError();
  }

}