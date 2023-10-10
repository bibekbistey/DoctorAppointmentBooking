import 'package:json_annotation/json_annotation.dart';

import '../model/user_api_model.dart';

part 'get_all_users_dto.g.dart';

@JsonSerializable()
class GetAllUsersDTO {
  final bool success;
  final String message;
  final List<UserApiModel> data;

  GetAllUsersDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllUsersDTOToJson(this);

  factory GetAllUsersDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersDTOFromJson(json);

 
}





 
