// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeApiModel _$HomeApiModelFromJson(Map<String, dynamic> json) => HomeApiModel(
      userId: json['_id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      specialization: json['specialization'] as String,
      experience: json['experience'] as String,
      feesPerCunsaltation: json['feesPerCunsaltation'] as int?,
      status: json['status'] as String,
      timings: json['timings'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$HomeApiModelToJson(HomeApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'specialization': instance.specialization,
      'experience': instance.experience,
      'feesPerCunsaltation': instance.feesPerCunsaltation,
      'status': instance.status,
      'timings': instance.timings,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
