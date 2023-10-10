import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String? userId;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String address;
  final String specialization;
  final String experience;
  final int? feesPerCunsaltation;
  String status;
  final String? timings;
  final String? createdAt;
  final String? updatedAt;

  HomeEntity(
      {this.userId,
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
      this.updatedAt});

  factory HomeEntity.fromJson(Map<String, dynamic> json) => HomeEntity(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json['lastName'],
        phone: json['phone'],
        email: json['email'],
        address: json['address'],
        specialization: json['specialization'],
        experience: json['experience'],
        feesPerCunsaltation: json['feesPerCunsaltation'],
        status: json['status'],
        timings: json['timings'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "address": address,
        "specialization": specialization,
        "experience": experience,
        "feesPerCunsaltation": feesPerCunsaltation,
        "status": status,
        "timings": timings,
        "createdAt":createdAt,
        "updatedAt":updatedAt
      };

  @override
  String toString() {
    return 'BatchEntity(userId: $userId, lastName: $lastName,phone:$phone,email:$email,address:$address,specialization$specialization,experience:$experience,feesPerCunsaltation:$feesPerCunsaltation,status:$status,timings:$timings,createdAt:$createdAt,updatedAt:$updatedAt)';
  }

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
        timings,createdAt,updatedAt
      ];
}
