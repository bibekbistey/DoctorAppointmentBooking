import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/doctor_entity.dart';
import '../repository/doctor_repository.dart';

final doctorUsecaseProvider = Provider<DoctorUseCase>(
  (ref) => DoctorUseCase(
    doctorRepository: ref.watch(doctorRepositoryProvider),
  ),
);

class DoctorUseCase {
  final IDoctorRepository doctorRepository;

  DoctorUseCase({required this.doctorRepository});

  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctores() {
  //   return doctorRepository.getAllDoctores();
  // }

  //  Future<Either<Failure, List<DoctorEntity>>> getAllDoctorList() {
  //   return doctorRepository.getAllDoctorList();
  // }

  Future<Either<Failure, bool>> addDoctor(DoctorEntity doctor) {
    return doctorRepository.addDoctor(doctor);
  }
}
