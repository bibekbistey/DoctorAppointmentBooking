// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoDTO _$GetUserInfoDTOFromJson(Map<String, dynamic> json) =>
    GetUserInfoDTO(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserInfoDTOToJson(GetUserInfoDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
