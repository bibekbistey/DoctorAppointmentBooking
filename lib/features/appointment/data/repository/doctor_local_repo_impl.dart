// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/failure/failure.dart';
// import '../../domain/entity/batch_entity.dart';
// import '../../domain/repository/doctor_repository.dart';
// import '../data_source/doctor_local_data_source.dart';

// final doctorLocalRepoProvider = Provider<IDoctorRepository>((ref) {
//   return DoctorLocalRepositoryImpl(
//     doctorLocalDataSource: ref.read(doctorLocalDataSourceProvider),
//   );
// });

// class DoctorLocalRepositoryImpl implements IDoctorRepository {
//   final DoctorLocalDataSource doctorLocalDataSource;

//   DoctorLocalRepositoryImpl({
//     required this.doctorLocalDataSource,
//   });

//   @override
//   Future<Either<Failure, bool>> addDoctor(DoctorEntity doctor) {
//     return doctorLocalDataSource.addDoctor(doctor);
//   }

//   @override
//   Future<Either<Failure, List<DoctorEntity>>> getAllDoctors() {
//     return doctorLocalDataSource.getAllDoctores();
//   }

//   // @override
//   // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByDoctor(
//   //     String DoctorId) {
//   //   // TODO: implement getAllStudentsByDoctor
//   //   throw UnimplementedError();
//   // }
// }
