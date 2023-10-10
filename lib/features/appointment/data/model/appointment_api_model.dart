// dart run build runner build --delete-conflicting-outputs

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/appointment_entity.dart';

part 'appointment_api_model.g.dart';

final appointmentApiModelProvider = Provider<AppointmentApiModel>(
  (ref) => AppointmentApiModel.empty(),
);

@JsonSerializable()
class AppointmentApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  @JsonKey(name:'doctorId')
  final String? doctorId;
  final String date;
  final String time;

  const AppointmentApiModel({
    this.userId,
    this.doctorId,
    required this.date,
    required this.time,
  });
  const AppointmentApiModel.empty()
      : userId='',
        doctorId='',
        
        date = '',
        time = '';

  Map<String, dynamic> toJson() => _$AppointmentApiModelToJson(this);

  factory AppointmentApiModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentApiModelFromJson(json);

  // Convert API Object to Entity
  AppointmentEntity toEntity() => AppointmentEntity(
        userId: userId,
        doctorId: doctorId,
        
        date: date,
        time: time,
      );
  // Convert Entity to API Object
  AppointmentApiModel fromEntity(AppointmentEntity entity) =>
      AppointmentApiModel(
        userId: entity.userId,
        doctorId: entity.doctorId,
        
        date: entity.date,
        time: entity.time,
      );

  // Convert API List to Entity List
  List<AppointmentEntity> toEntityList(List<AppointmentApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [userId,doctorId,date, time];
}






// dart run build runner build --delete-conflicting-outputs

// import 'package:equatable/equatable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../domain/entity/appointment_entity.dart';

// part 'appointment_api_model.g.dart';

// final appointmentApiModelProvider = Provider<AppointmentApiModel>(
//   (ref) => AppointmentApiModel.empty(),
// );

// @JsonSerializable()
// class AppointmentApiModel extends Equatable {
//   @JsonKey(name: '_id')
//   Id id;
//   final String userId;  
//   DateTime date;
//   DateTime time;
//   String status;

//   const AppointmentApiModel({
//     required this.id,
//     required this.userId,
//     required this.status,
//     required this.date,
//     required this.time,
//   });
//   const AppointmentApiModel.empty()
//       : userId='',
//         date = ,
//         time = ;

//   Map<String, dynamic> toJson() => _$AppointmentApiModelToJson(this);

//   factory AppointmentApiModel.fromJson(Map<String, dynamic> json) =>
//       _$AppointmentApiModelFromJson(json);

//   // Convert API Object to Entity
//   AppointmentEntity toEntity() => AppointmentEntity(
//         userId: userId,
//         doctorId: doctorId,
//         userInfo: userInfo,
//         doctorInfo: doctorInfo,
//         date: date,
//         time: time,
//       );
//   // Convert Entity to API Object
//   AppointmentApiModel fromEntity(AppointmentEntity entity) =>
//       AppointmentApiModel(
//         userId: entity.userId,
//         doctorId: entity.doctorId,
//         doctorInfo: entity.doctorInfo,
//         userInfo: entity.userInfo,
//         date: entity.date,
//         time: entity.time,
//       );

//   // Convert API List to Entity List
//   List<AppointmentEntity> toEntityList(List<AppointmentApiModel> models) =>
//       models.map((model) => model.toEntity()).toList();

//   @override
//   List<Object?> get props => [userId,doctorId,doctorInfo,userInfo,date, time];
// }
