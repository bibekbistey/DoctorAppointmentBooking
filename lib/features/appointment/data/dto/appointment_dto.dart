import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/features/appointment/data/model/appointment_api_model.dart';



part 'appointment_dto.g.dart';



@JsonSerializable()
class GetAppointmentsDTO {
  final bool success;
  final String message;
  final List<AppointmentApiModel> data;

  GetAppointmentsDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAppointmentsDTOToJson(this);

  factory GetAppointmentsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAppointmentsDTOFromJson(json);

 
}








 
