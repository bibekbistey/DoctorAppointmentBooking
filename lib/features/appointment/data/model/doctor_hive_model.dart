// import 'package:equatable/equatable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';
// import 'package:uuid/uuid.dart';

// import '../../../../config/constants/hive_table_constant.dart';
// import '../../domain/entity/batch_entity.dart';

// part 'doctor_hive_model.g.dart';

// final doctorHiveModelProvider = Provider(
//   (ref) => DoctorHiveModel.empty(),
// );

// @HiveType(typeId: HiveTableConstant.doctorTableId)
// class DoctorHiveModel {
//   @HiveField(0)
//   final String userId;

//   @HiveField(1)
//   final String firstName;

//   @HiveField(2)
//   final String lastName;

//   @HiveField(3)
//   final String phone;

//   @HiveField(4)
//   final String email;

//   @HiveField(5)
//   final String website;

//   @HiveField(6)
//   final String address;

//   @HiveField(7)
//   final String specialization;

//   @HiveField(8)
//   final String experience;

//   @HiveField(9)
//   final String feesPerCunsaltation;

//   @HiveField(10)
//   final String status;

//   @HiveField(11)
//   final String timings;

//   // empty constructor
//   DoctorHiveModel.empty()
//       : this(
//           userId: '',
//           firstName: '',
//           lastName: '',
//           phone: '',
//           email: '',
//           website: '',
//           address: '',
//           specialization: '',
//           experience: '',
//           feesPerCunsaltation: '',
//           status: '',
//           timings: '',
//         );

//   DoctorHiveModel({
//     String? userId,
//     required this.firstName,
//     required this.lastName,
//     required this.phone,
//     required this.email,
//     required this.website,
//     required this.address,
//     required this.specialization,
//     required this.experience,
//     required this.feesPerCunsaltation,
//     required this.status,
//     required this.timings,
//   }) : userId = userId ?? const Uuid().v4();

//   // Convert Hive Object to Entity
//   DoctorEntity toEntity() => DoctorEntity(
//       userId: userId,
//       firstName: firstName,
//       lastName: lastName,
//       phone: phone,
//       email: email,
//       website: website,
//       address: address,
//       specialization: specialization,
//       experience: experience,
//       feesPerCunsaltation: feesPerCunsaltation,
//       status: status,
//       timings: timings);

//   // Convert Entity to Hive Object
//   DoctorHiveModel toHiveModel(DoctorEntity entity) => DoctorHiveModel(
//       // DoctorId: entity.DoctorId,
//       userId: entity.userId ?? '',
//       firstName: entity.firstName,
//       lastName: entity.lastName ?? '',
//       phone: entity.phone,
//       email: email,
//       website: website,
//       address: address,
//       specialization: specialization,
//       experience: entity.experience,
//       feesPerCunsaltation: entity.feesPerCunsaltation,
//       status: entity.status,
//       timings: entity.timings);

//   // Convert Hive List to Entity List
//   List<DoctorEntity> toEntityList(List<DoctorHiveModel> models) =>
//       models.map((model) => model.toEntity()).toList();

//   @override
//   String toString() {
//     return 'userId: $userId, firstName: $firstName, lastname:$lastName,phone:$phone,email:$email,website:$website,address:$address,specialization:$specialization,experience:$experience,feePerCunsaltation:$feesPerCunsaltation,status:$status,timings:$timings';
//   }
// }

// // @JsonSerializable()
// // class DoctorHiveModel extends Equatable {
// //   @JsonKey(name: '_id')
// //   final String? userId;
// //   final String firstName;
// //   final String lastName;
// //   final String phone;
// //   final String email;
// //   final String website;
// //   final String address;
// //   final String specialization;
// //   final String experience;
// //   final String feesPerCunsaltation;
// //   final String status;
// //   final String timings;

// //   const DoctorHiveModel({
// //     required this.userId,
// //     required this.firstName,
// //     required this.lastName,
// //     required this.phone,
// //     required this.email,
// //     required this.website,
// //     required this.address,
// //     required this.specialization,
// //     required this.experience,
// //     required this.feesPerCunsaltation,
// //     required this.status,
// //     required this.timings,
// //   });
// //   const DoctorHiveModel.empty()
// //       : userId = '',
// //         firstName = '',
// //         lastName = '',
// //         phone = '',
// //         email = '',
// //         website = '',
// //         address = '',
// //         specialization = '',
// //         experience = '',
// //         feesPerCunsaltation = '',
// //         status = '',
// //         timings = '';

// //   Map<String, dynamic> toJson() => _$DoctorHiveModelToJson(this);

// //   factory DoctorHiveModel.fromJson(Map<String, dynamic> json) =>
// //       _$DoctorHiveModelFromJson(json);

// //   // Convert Hive Object to Entity
// //   DoctorEntity toEntity() => DoctorEntity(
// //       userId: userId,
// //       firstName: firstName,
// //       lastName: lastName,
// //       phone: phone,
// //       email: email,
// //       website: website,
// //       address: address,
// //       specialization: specialization,
// //       experience: experience,
// //       feesPerCunsaltation: feesPerCunsaltation,
// //       status: status,
// //       timings: timings);

// //   // Convert Entity to Hive Object
// //   DoctorHiveModel fromEntity(DoctorEntity entity) => DoctorHiveModel(
// //       userId: entity.userId ?? '',
// //       firstName: entity.firstName,
// //       lastName: entity.lastName ?? '',
// //       phone: entity.phone,
// //       email: email,
// //       website: website,
// //       address: address,
// //       specialization: specialization,
// //       experience: entity.experience,
// //       feesPerCunsaltation: entity.feesPerCunsaltation,
// //       status: entity.status,
// //       timings: entity.timings);

// //   // Convert Hive List to Entity List
// //   List<DoctorEntity> toEntityList(List<DoctorHiveModel> models) =>
// //       models.map((model) => model.toEntity()).toList();

// //   @override
// //   List<Object?> get props => [
// //         userId,
// //         firstName,
// //         lastName,
// //         phone,
// //         email,
// //         website,
// //         address,
// //         specialization,
// //         experience,
// //         feesPerCunsaltation,
// //         status,
// //         timings
// //       ];
// // }
