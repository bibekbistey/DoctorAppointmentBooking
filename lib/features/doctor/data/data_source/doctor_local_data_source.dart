// //dart run build_runner build --delete-conflicting-outputs
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/failure/failure.dart';

// import '../../../../core/network/local/hive_service.dart';
// import '../../../../core/shared_prefs/user_shared_prefs.dart';

// import '../../domain/entity/batch_entity.dart';
// import '../dto/get_all_doctor_dto.dart';
// import '../model/doctor_Hive_model.dart';
// import '../model/doctor_hive_model.dart';

// final doctorLocalDataSourceProvider = Provider(
//   (ref) => DoctorLocalDataSource(
//     hiveService: ref.read(hiveServiceProvider),
//     doctorHiveModel: ref.read(doctorHiveModelProvider),
    
//   ),
// );

// class DoctorLocalDataSource {
//   final HiveService hiveService;
//   final DoctorHiveModel doctorHiveModel;

//   DoctorLocalDataSource({
//     required this.hiveService,
//     required this.doctorHiveModel,
//   });

//   Future<Either<Failure, bool>> addDoctor(DoctorEntity Doctor) async {
//     try {
//       // Convert Entity to Hive Object
//       final hiveDoctor = doctorHiveModel.toHiveModel(Doctor);
//       // Add to Hive
//       await hiveService.addDoctor(hiveDoctor);
//       return const Right(true);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   Future<Either<Failure, List<DoctorEntity>>> getAllDoctores() async {
//     try {
//       // Get all Doctores from Hive
//       final doctores = await hiveService.getAllDoctores();
//       // Convert Hive Object to Entity
//       final doctorEntities = DoctorHiveModel.toEntityList(Doctores);
//       return Right(DoctorEntities);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   // Get all students by doctorId
// }
