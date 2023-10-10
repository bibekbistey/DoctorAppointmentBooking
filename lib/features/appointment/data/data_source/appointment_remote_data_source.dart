//dart run build_runner build --delete-conflicting-outputs
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/appointment_entity.dart';
import '../dto/appointment_dto.dart';
import '../model/appointment_api_model.dart';

final appointmentRemoteDataSourceProvider = Provider(
  (ref) => AppointmentRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    appointmentApiModel: ref.read(appointmentApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class AppointmentRemoteDataSource {
  final Dio dio;
  final AppointmentApiModel appointmentApiModel;

  final UserSharedPrefs userSharedPrefs;

  AppointmentRemoteDataSource({
    required this.dio,
    required this.appointmentApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addAppointment(
      AppointmentEntity appointment) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.post(ApiEndpoints.addAppointment,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          // data: appointmentApiModel.fromEntity(appointment).toJson(),
          data: {            
            "date": appointment.date,
            "time": appointment.time,
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

  Future<Either<Failure, List<AppointmentEntity>>> getAppointments() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.get(
        ApiEndpoints.getAppointments,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAppointmentsDTO userAddDTO = GetAppointmentsDTO.fromJson(response.data);
        return Right(appointmentApiModel.toEntityList(userAddDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  // Get all students by appointmentId
}
