import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/features/home/data/model/home_api_model.dart';



part 'get_all_doctor_list_dto.g.dart';

@JsonSerializable()
class GetAllDoctorListDTO {
  final bool success;
  
  final List<HomeApiModel> data;

  GetAllDoctorListDTO({
    required this.success,
    
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllDoctorListDTOToJson(this);

  factory GetAllDoctorListDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllDoctorListDTOFromJson(json);
}
