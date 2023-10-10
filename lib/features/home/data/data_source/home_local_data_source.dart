import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';

import '../../domain/entity/home_entity.dart';
import '../model/home_hive_model.dart';

// Dependency Injection using Riverpod
final homeLocalDataSourceProvider = Provider<HomeLocalDataSource>((ref) {
  return HomeLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      homeHiveModel: ref.read(homeHiveModelProvider));
});

class HomeLocalDataSource {
  final HiveService hiveService;
  final HomeHiveModel homeHiveModel;

  HomeLocalDataSource({
    required this.hiveService,
    required this.homeHiveModel,
  });

  

  Future<Either<Failure, List<HomeEntity>>> getAllDoctors() async {
    try {
      // Get all doctors from Hive
      final doctors = await hiveService.getAllDoctors();
      // Convert Hive Object to Entity
      final homeEntities = homeHiveModel.toEntityList(doctors);
      print(homeEntities);
      return Right(homeEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}