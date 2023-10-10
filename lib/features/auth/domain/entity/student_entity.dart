import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final String name;
  final String email;
  final String password;

  const StudentEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
