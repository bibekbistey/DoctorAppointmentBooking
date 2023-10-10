// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctor_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDoctorListDTO _$GetAllDoctorListDTOFromJson(Map<String, dynamic> json) =>
    GetAllDoctorListDTO(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => HomeApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDoctorListDTOToJson(
        GetAllDoctorListDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
