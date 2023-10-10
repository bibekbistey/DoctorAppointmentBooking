import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../config/constants/api_endpoint.dart';

import '../../../../core/failure/failure.dart';

import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/doctor_entity.dart';
import '../data_source/doctor_remote_data_source.dart';
import '../model/doctor_api_model.dart';
import 'get_all_doctor_dto.dart';

final doctorRemoteDataSourceProvider = Provider(
  (ref) => DoctorRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    doctorApiModel: ref.read(doctorApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class DoctorRemoteDataSource {
  late final Dio dio;

  late final DoctorApiModel doctorApiModel;

  late final UserSharedPrefs userSharedPrefs;

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
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),

          // data: bookingApiModel.fromEntity(booking).toJson(),

          data: {
            "firstname": doctor.firstName,
            "lastname": doctor.lastName,
            "phone": doctor.phone,
            "email": doctor.email,
            "address": doctor.address,
            "specialization": doctor.specialization,
            "experience": doctor.experience,
            "fee": doctor.feesPerCunsaltation,
            "timing": doctor.timings,
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

  // Future<Either<Failure, List<DoctorEntity>>> getAllDoctors() async {
  //   try {
  //     String? token;

  //     await userSharedPrefs.getUserToken().then(
  //           (value) => value.fold((l) => null, (r) => token = r!),
  //         );

  //     var response = await dio.get(
  //       ApiEndpoints.getAllDoctors,
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       // OR

  //       // 2nd way

  //       GetAllDoctorDTO batchAddDTO = GetAllDoctorDTO.fromJson(response.data);

  //       return Right(doctorApiModel.toEntityList(batchAddDTO.data));
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
}
