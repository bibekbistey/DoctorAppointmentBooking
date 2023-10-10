import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:my_app/features/doctor/data/model/doctor_api_model.dart';
import 'package:path_provider/path_provider.dart';


import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/home_entity.dart';

import '../dto/get_all_doctor_list_dto.dart';
import '../dto/get_all_doctorss_dto.dart';
import '../model/home_api_model.dart';
import '../model/home_hive_model.dart';

final homeRemoteDataSourceProvider = Provider(
  (ref) => HomeRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    homeApiModel: ref.read(homeApiModelProvider),
    homeHiveModel: ref.read(homeHiveModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class HomeRemoteDataSource {
  final Dio dio;
  final HomeApiModel homeApiModel;
  final UserSharedPrefs userSharedPrefs;
  final HomeHiveModel homeHiveModel;

  HomeRemoteDataSource({
    required this.dio,
    required this.homeApiModel,
    required this.homeHiveModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addDoctor(HomeEntity doctor) async {
    try {
      var response = await dio.post(
        ApiEndpoints.addDoctor,
        data: homeApiModel.fromEntity(doctor).toJson(),
      );

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



  Future<Either<Failure, List<HomeEntity>>> getAllDoctorList() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );
      var response = await dio.get(ApiEndpoints.getAllDoctorList, options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),);
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllDoctorListDTO doctorListAddDTO = GetAllDoctorListDTO.fromJson(response.data);
        return Right(homeApiModel.toEntityList(doctorListAddDTO.data));
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

  // Future<Either<Failure, bool>> deleteHome(String homeId) async {
  //   try {
  //     // Get the token from shared prefs
  //     String? token;
  //     var data = await userSharedPrefs.getUserToken();
  //     data.fold(
  //       (l) => token = null,
  //       (r) => token = r!,
  //     );

  //     Response response = await dio.delete(
  //       ApiEndpoints.deleteHome + homeId,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       return const Right(true);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.data["message"],
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.error.toString(),
  //         statusCode: e.response?.statusCode.toString() ?? '0',
  //       ),
  //     );
  //   }
  // }

  Future<Either<Failure, List<HomeEntity>>> getAllDoctors() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.get(
        ApiEndpoints.getAllDoctors,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllDoctorsDTO homeAddDTO = GetAllDoctorsDTO.fromJson(response.data);
        var data = response.data["data"] as List<dynamic>;
         List<HomeApiModel> doctor = data.map((item) {
          return HomeApiModel.fromJson(item as Map<String, dynamic>);
        }).toList();

        final doctorEntities = homeApiModel.toEntityList(doctor);

        final doctorHiveModels = homeHiveModel.fromApiModelList(doctor);

              var directory = await getApplicationDocumentsDirectory();
        Hive.init(directory.path);

        final doctorBox = await Hive.openBox<HomeHiveModel>('doctorBox');

        doctorBox.clear();
        doctorBox.addAll(doctorHiveModels);
        print(homeHiveModel);
        return Right(doctorEntities);
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

  // Get all students by homeId
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByHome(
  //     String homeId) async {
  //   try {
  //     // get token
  //     String? token;
  //     await userSharedPrefs
  //         .getUserToken()
  //         .then((value) => value.fold((l) => null, (r) => token = r!));

  //     var response = await dio.get(ApiEndpoints.getStudentsByHome + homeId,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token',
  //           },
  //         ));
  //     if (response.statusCode == 201) {
  //       GetAllStudentsByHomeDTO getAllStudentDTO =
  //           GetAllStudentsByHomeDTO.fromJson(response.data);

  //       return Right(authApiModel.listFromJson(getAllStudentDTO.data));
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



  Future<Either<Failure, bool>> approveDoctor(String userId,String status) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      print(userId);
      Response response = await dio.post(

        ApiEndpoints.approveDoctor(userId,status),
        
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          
        ),
        
        data: {
            "doctorId": userId,
            "status": status
          }
      );
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // Delete Doctor

  Future<Either<Failure, bool>> deleteDoctor(String doctorId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteDoctor + doctorId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
