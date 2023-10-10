import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/features/home/data/model/home_api_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/home_entity.dart';

part 'home_hive_model.g.dart';

final homeHiveModelProvider = Provider((ref) => HomeHiveModel.empty());

@HiveType(typeId: HiveTableConstant.doctorTableId)
class HomeHiveModel {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String address;
  @HiveField(6)
  final String specialization;
  @HiveField(7)
  final String experience;
  @HiveField(8)
  final int? feesPerCunsaltation;
  @HiveField(9)
  final String status;
  @HiveField(10)
  final String? timings;
  

  // empty constructor
  HomeHiveModel.empty()
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
        timings = '';

  HomeHiveModel({
    String? userId,
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
  }) : userId = userId ?? const Uuid().v4();

  // Convert Hive Object to Entity
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
      );

  // Convert Entity to Hive Object
  HomeHiveModel toHiveModel(HomeEntity entity) => HomeHiveModel(
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
      );

  List<HomeHiveModel> fromApiModelList(List<HomeApiModel> apiModels) {
    return apiModels
        .map((apiModel) => HomeHiveModel(
              userId: apiModel.userId,
              firstName: apiModel.firstName,
              lastName: apiModel.lastName,
              phone: apiModel.phone,
              email: apiModel.email,
              address: apiModel.address,
              specialization: apiModel.specialization,
              experience: apiModel.experience,
              feesPerCunsaltation: apiModel.feesPerCunsaltation,
              timings: apiModel.timings,
              status: apiModel.status,
            ))
        .toList();
  }

  // Convert Hive List to Entity List
  List<HomeEntity> toEntityList(List<HomeHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'HomeHiveModel(userId: $userId, lastName: $lastName,phone:$phone,email:$email,address:$address,specialization$specialization,experience:$experience,feesPerCunsaltation:$feesPerCunsaltation,status:$status,timings:$timings)';
  }
}