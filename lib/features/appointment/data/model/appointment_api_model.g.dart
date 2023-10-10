// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentApiModel _$AppointmentApiModelFromJson(Map<String, dynamic> json) =>
    AppointmentApiModel(
      userId: json['_id'] as String?,
      doctorId: json['doctorId'] as String?,
      date: json['date'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$AppointmentApiModelToJson(
        AppointmentApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'doctorId': instance.doctorId,
      'date': instance.date,
      'time': instance.time,
    };
