//dart run build_runner build --delete-conflicting-outputs
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/doctor_entity.dart';
import '../dto/get_all_doctor_dto.dart';
import '../model/doctor_api_model.dart';

final doctorRemoteDataSourceProvider = Provider(
  (ref) => DoctorRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    doctorApiModel: ref.read(doctorApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class DoctorRemoteDataSource {
  final Dio dio;
  final DoctorApiModel doctorApiModel;

  final UserSharedPrefs userSharedPrefs;

  DoctorRemoteDataSource({
    required this.dio,
    required this.doctorApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addDoctor(DoctorEntity doctor) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.post(ApiEndpoints.addDoctor,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          // data: doctorApiModel.fromEntity(doctor).toJson(),
          data: {
            "firstName": doctor.firstName,
            "lastName": doctor.lastName,
            "phone": doctor.phone,
            "email": doctor.email,
            "address": doctor.address,
            "specialization": doctor.specialization,
            "experience": doctor.experience,
            "feesPerCunsaltation": doctor.feesPerCunsaltation,
            "timings": doctor.timings,
            "status": doctor.status
          });

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctores() async {
  //   try {
  //     String? token;
  //     await userSharedPrefs.getUserToken().then(
  //           (value) => value.fold((l) => null, (r) => token = r),
  //         );
  //     var response = await dio.get(ApiEndpoints.getAllDoctors,
  //      options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),);
  //     if (response.statusCode == 200) {
  //       // OR
  //       // 2nd way
  //       GetAllDoctorDTO doctorAddDTO = GetAllDoctorDTO.fromJson(response.data);
  //       return Right(doctorApiModel.toEntityList(doctorAddDTO.data));
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.statusMessage.toString(),
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.error.toString(),
  //       ),
  //     );
  //   }
  // }




  

  // Get all students by doctorId
}
