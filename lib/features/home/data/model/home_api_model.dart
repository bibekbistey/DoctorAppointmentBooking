
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/home_entity.dart';

part 'home_api_model.g.dart';

final homeApiModelProvider = Provider<HomeApiModel>(
  (ref) => HomeApiModel.empty(),
);

@JsonSerializable()
class HomeApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String address;
  final String specialization;
  final String experience;
  final int? feesPerCunsaltation;
  final String status;
  final String? timings;
  final String? createdAt;
  final String? updatedAt;


  HomeApiModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.specialization,
    required this.experience,
    this.feesPerCunsaltation,
    required this.status,
    this.timings,
    this.createdAt,
    this.updatedAt,
  });


  HomeApiModel.empty()
      : userId = '',
        firstName = '',
        lastName = '',
        phone = '',
        email = '',
        address = '',
        specialization = '',
        experience = '',
        feesPerCunsaltation = 0,
        status = '',
        timings = '',
        createdAt='',
        updatedAt='';

  Map<String, dynamic> toJson() => _$HomeApiModelToJson(this);

  factory HomeApiModel.fromJson(Map<String, dynamic> json) =>
      _$HomeApiModelFromJson(json);

  // Convert API Object to Entity
  HomeEntity toEntity() => HomeEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      address: address,
      specialization: specialization,
      experience: experience,
      feesPerCunsaltation: feesPerCunsaltation,
      status: status,
      timings: timings!,
      createdAt:createdAt,
      updatedAt:updatedAt,);

  // Convert Entity to API Object
  HomeApiModel fromEntity(HomeEntity entity) => HomeApiModel(
      userId: entity.userId ?? '',
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      email: email,
      address: address,
      specialization: specialization,
      experience: entity.experience,
      feesPerCunsaltation: entity.feesPerCunsaltation,
      status: entity.status,
      timings: entity.timings,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt);

  // Convert API List to Entity List
  List<HomeEntity> toEntityList(List<HomeApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        phone,
        email,
        address,
        specialization,
        experience,
        feesPerCunsaltation,
        status,
        timings,
        createdAt,updatedAt,
      ];
}
