// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDoctorDTO _$GetAllDoctorDTOFromJson(Map<String, dynamic> json) =>
    GetAllDoctorDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DoctorApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDoctorDTOToJson(GetAllDoctorDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
