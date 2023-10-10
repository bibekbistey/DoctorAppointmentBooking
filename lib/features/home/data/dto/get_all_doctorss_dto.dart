import 'package:json_annotation/json_annotation.dart';

import '../model/home_api_model.dart';

part 'get_all_doctorss_dto.g.dart';

@JsonSerializable()
class GetAllDoctorsDTO {
  final bool success;
  final String message;
  final List<HomeApiModel> data;

  GetAllDoctorsDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllDoctorsDTOToJson(this);

  factory GetAllDoctorsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllDoctorsDTOFromJson(json);
}
