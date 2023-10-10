// import 'package:equatable/equatable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../domain/entity/user_entity.dart';

// part 'user_api_model.g.dart';

// final userApiModelProvider = Provider<UserApiModel>(
//   (ref) => const UserApiModel.empty(),
// );

// @JsonSerializable()
// class UserApiModel extends Equatable {
//   @JsonKey(name: '_id')
//   final String title;
//   final String author;
//   final String description;
//   final String genre;
//   final String language;
//   final String bookCover;
//   final String date;

//   const UserApiModel({
//     required this.title,
//     required this.author,
//     required this.description,
//     required this.genre,
//     required this.language,
//     required this.bookCover,
//     required this.date,
//   });
//   const UserApiModel.empty()
//       : title = '',
//         author = '',
//         description = '',
//         genre = '',
//         language = '',
//         bookCover = '',
//         date = '';

//   Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

//   factory UserApiModel.fromJson(Map<String, dynamic> json) =>
//       _$UserApiModelFromJson(json);

//   // Convert API Object to Entity
//   UserEntity toEntity() => UserEntity(
//         title: title,
//         author: author,
//         description: description,
//         genre: genre,
//         language: language,
//         bookCover: bookCover,
//         date: date,
//       );

//   // Convert Entity to API Object
//   UserApiModel fromEntity(UserEntity entity) => UserApiModel(
//         title: entity.title,
//         author: entity.author,
//         description: entity.description,
//         genre: entity.genre,
//         language: entity.language,
//         bookCover: entity.bookCover,
//         date: entity.date,
//       );

//   // Convert API List to Entity List
//   List<UserEntity> toEntityList(List<UserApiModel> models) =>
//       models.map((model) => model.toEntity()).toList();

//   @override
//   List<Object?> get props => [
//         title,
//         author,
//         description,
//         genre,
//         language,
//         bookCover,
//         date,
//       ];
// }

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'user_api_model.g.dart';

final userApiModelProvider = Provider<UserApiModel>(
  (ref) => const UserApiModel.empty(),
);

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String name;
  final String email;
  
 

  const UserApiModel({
    this.userId,
    required this.name,
    required this.email,
  });
  const UserApiModel.empty()
      : userId = '',
        name = '',
        email = '';

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  // Convert API Object to Entity
  UserEntity toEntity() => UserEntity(
      userId: userId ?? '',
      name:name,
      email: email,
      );

  // Convert Entity to API Object
  UserApiModel fromEntity(UserEntity entity) => UserApiModel(
      userId: userId ?? '',
      name: entity.name,
      email: entity.email,
      );

  // Convert API List to Entity List
  List<UserEntity> toEntityList(List<UserApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        userId,
        name,
        email,
        
      ];
}
