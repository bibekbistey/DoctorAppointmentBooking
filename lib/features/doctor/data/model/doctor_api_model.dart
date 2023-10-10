import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/doctor_entity.dart';

part 'doctor_api_model.g.dart';

final doctorApiModelProvider = Provider<DoctorApiModel>(
  (ref) => const DoctorApiModel.empty(),
);

@JsonSerializable()
class DoctorApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String website;
  final String address;
  final String specialization;
  final String experience;
  final int feesPerCunsaltation;
  final String? status;
  final String timings;

  const DoctorApiModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.website,
    required this.address,
    required this.specialization,
    required this.experience,
    required this.feesPerCunsaltation,
    this.status,
    required this.timings,
  });
  const DoctorApiModel.empty()
      : userId = '',
        firstName = '',
        lastName = '',
        phone = '',
        email = '',
        website = '',
        address = '',
        specialization = '',
        experience = '',
        feesPerCunsaltation = 0,
        status = '',
        timings = '';

  Map<String, dynamic> toJson() => _$DoctorApiModelToJson(this);

  factory DoctorApiModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorApiModelFromJson(json);

  // Convert API Object to Entity
  DoctorEntity toEntity() => DoctorEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      website: website,
      address: address,
      specialization: specialization,
      experience: experience,
      feesPerCunsaltation: feesPerCunsaltation,
      status: status,
      timings: timings);

  // Convert Entity to API Object
  DoctorApiModel fromEntity(DoctorEntity entity) => DoctorApiModel(
      userId: entity.userId ?? '',
      firstName: entity.firstName,
      lastName: entity.lastName ?? '',
      phone: entity.phone,
      email: email,
      website: website,
      address: address,
      specialization: specialization,
      experience: entity.experience,
      feesPerCunsaltation: entity.feesPerCunsaltation,
      status: entity.status,
      timings: entity.timings);

  // Convert API List to Entity List
  List<DoctorEntity> toEntityList(List<DoctorApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        phone,
        email,
        website,
        address,
        specialization,
        experience,
        feesPerCunsaltation,
        status,
        timings
      ];
}
