import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/doctor_entity.dart';
import '../../domain/repository/doctor_repository.dart';
import '../data_source/doctor_remote_data_source.dart';

final doctorRemoteRepoProvider = Provider<IDoctorRepository>(
  (ref) => DoctorRemoteRepositoryImpl(
    doctorRemoteDataSource: ref.read(doctorRemoteDataSourceProvider),
  ),
);

class DoctorRemoteRepositoryImpl implements IDoctorRepository {
  final DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRemoteRepositoryImpl({required this.doctorRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addDoctor(DoctorEntity doctor) {
    return doctorRemoteDataSource.addDoctor(doctor);
  }

  // @override
  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctores() {
  //   return doctorRemoteDataSource.getAllDoctores();
  // }

  // @override
  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctorList() {
  //   return doctorRemoteDataSource.getAllDoctorList();
  // }
}
