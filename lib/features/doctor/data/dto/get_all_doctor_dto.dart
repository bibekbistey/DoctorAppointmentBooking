import 'package:json_annotation/json_annotation.dart';

import '../model/doctor_api_model.dart';

part 'get_all_doctor_dto.g.dart';

@JsonSerializable()
class GetAllDoctorDTO {
  final bool success;
  final String message;
  final List<DoctorApiModel> data;

  GetAllDoctorDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllDoctorDTOToJson(this);

  factory GetAllDoctorDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllDoctorDTOFromJson(json);
}
