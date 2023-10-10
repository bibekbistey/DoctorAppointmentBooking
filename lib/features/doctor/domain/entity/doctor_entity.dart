import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final String? userId;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String? website;
  final String address;
  final String specialization;
  final String experience;
  final int feesPerCunsaltation;
  final String? status;
  final String timings;

  const DoctorEntity(
      {this.userId,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      this.website,
      required this.address,
      required this.specialization,
      required this.experience,
      required this.feesPerCunsaltation,
      this.status,
      required this.timings});

  factory DoctorEntity.fromJson(Map<String, dynamic> json) => DoctorEntity(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json['lastName'],
        phone: json['phone'],
        email: json['email'],
        website: json['website'],
        address: json['address'],
        specialization: json['specialization'],
        experience: json['experience'],
        feesPerCunsaltation: json['feesPerCunsaltation'],
        status: json['status'],
        timings: json['timings'],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "website": website,
        "address": address,
        "specialization": specialization,
        "experience": experience,
        "feesPerCunsaltation": feesPerCunsaltation,
        "status": status,
        "timings": timings
      };

  @override
  String toString() {
    return 'BatchEntity(userId: $userId, lastName: $lastName,phone:$phone,email:$email,website:$website,address:$address,specialization$specialization,experience:$experience,feesPerCunsaltation:$feesPerCunsaltation,status:$status,timings:$timings)';
  }

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
