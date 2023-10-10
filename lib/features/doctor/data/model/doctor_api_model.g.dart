// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorApiModel _$DoctorApiModelFromJson(Map<String, dynamic> json) =>
    DoctorApiModel(
      userId: json['_id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      address: json['address'] as String,
      specialization: json['specialization'] as String,
      experience: json['experience'] as String,
      feesPerCunsaltation: json['feesPerCunsaltation'] as int,
      status: json['status'] as String?,
      timings: json['timings'] as String,
    );

Map<String, dynamic> _$DoctorApiModelToJson(DoctorApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'address': instance.address,
      'specialization': instance.specialization,
      'experience': instance.experience,
      'feesPerCunsaltation': instance.feesPerCunsaltation,
      'status': instance.status,
      'timings': instance.timings,
    };
