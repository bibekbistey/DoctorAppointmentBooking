import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/student_entity.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel {
  @HiveField(0)
  final String studentId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  // Constructor
  AuthHiveModel({
    String? studentId,
    required this.name,
    required this.email,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
          studentId: '',
          name: '',
          email: '',
          password: '',
        );

  // Convert Hive Object to Entity
  StudentEntity toEntity() => StudentEntity(
        // id: studentId,
        name: name,
        email: email,
        password: password,
      );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(StudentEntity entity) => AuthHiveModel(
        studentId: const Uuid().v4(),
        name: entity.name,
        email: entity.email,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<StudentEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'studentId: $studentId, name: $name, email: $email, password: $password';
  }
}
