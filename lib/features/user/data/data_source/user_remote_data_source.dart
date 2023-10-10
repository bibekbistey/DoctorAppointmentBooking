import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/user_entity.dart';

import '../dto/get_all_users_dto.dart';
import '../dto/get_user_info_dto.dart';
import '../model/user_api_model.dart';

final userRemoteDataSourceProvider = Provider(
  (ref) => UserRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userApiModel: ref.read(userApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class UserRemoteDataSource {
  final Dio dio;
  final UserApiModel userApiModel;
  final UserSharedPrefs userSharedPrefs;

  UserRemoteDataSource({
    required this.dio,
    required this.userApiModel,
    required this.userSharedPrefs,
  });

  // Future<Either<Failure, bool>> addDoctor(UserEntity doctor) async {
  //   try {
  //     var response = await dio.post(
  //       ApiEndpoints.addDoctor,
  //       data: userApiModel.fromEntity(doctor).toJson(),
  //     );

  //     if (response.statusCode == 201) {
  //       return const Right(true);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.data['message'],
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.message.toString(),
  //       ),
  //     );
  //   }
  // }


    Future<Either<Failure, List<UserEntity>>> getUserInfo() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.get(
        ApiEndpoints.getUserInfo,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetUserInfoDTO userInfoDTO = GetUserInfoDTO.fromJson(response.data);
        return Right(userApiModel.toEntityList(userInfoDTO.data));
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

  

  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.get(
        ApiEndpoints.getAllUsers,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllUsersDTO userAddDTO = GetAllUsersDTO.fromJson(response.data);
        return Right(userApiModel.toEntityList(userAddDTO.data));
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

  // Update Profile
  Future<Either<Failure, bool>> editProfile(UserEntity user) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      var response = await dio.put(
        ApiEndpoints.editProfile,
        data: {
          "name": user.name,
          
          "email": user.email,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        // Profile edited successfully
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: 'Failed to edit profile. Please try again.',
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



  Future<Either<Failure, bool>> deleteUser(String userId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteUser + userId,
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

  // Get all students by userId
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByUser(
  //     String userId) async {
  //   try {
  //     // get token
  //     String? token;
  //     await userSharedPrefs
  //         .getUserToken()
  //         .then((value) => value.fold((l) => null, (r) => token = r!));

  //     var response = await dio.get(ApiEndpoints.getStudentsByUser + userId,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token',
  //           },
  //         ));
  //     if (response.statusCode == 201) {
  //       GetAllStudentsByUserDTO getAllStudentDTO =
  //           GetAllStudentsByUserDTO.fromJson(response.data);

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
}
