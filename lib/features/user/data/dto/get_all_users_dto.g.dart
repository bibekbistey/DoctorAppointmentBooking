// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersDTO _$GetAllUsersDTOFromJson(Map<String, dynamic> json) =>
    GetAllUsersDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUsersDTOToJson(GetAllUsersDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
