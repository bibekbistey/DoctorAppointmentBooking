// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctorss_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDoctorsDTO _$GetAllDoctorsDTOFromJson(Map<String, dynamic> json) =>
    GetAllDoctorsDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => HomeApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDoctorsDTOToJson(GetAllDoctorsDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
