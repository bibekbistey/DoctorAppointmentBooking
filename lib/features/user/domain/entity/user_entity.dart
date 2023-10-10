import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String name;
  final String email;
  
  const UserEntity(
      {
        this.userId,
      required this.name,
      required this.email,
      });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        userId: json["userId"],       
        name: json["name"],
        email: json['email'],
        
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        
      };

  @override
  String toString() {
    return 'UserEntity(userId:$userId, name: $name,email:$email)';
  }

  @override
  List<Object?> get props => [
    userId,
        name,
        email,
      ];
}
