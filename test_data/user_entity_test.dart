import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_app/features/user/domain/entity/user_entity.dart';

Future<List<UserEntity>> getAllUsers() async {
  final response =
      await rootBundle.loadString('test_data/user_test_data.json');
  final jsonList = await json.decode(response);

  final List<UserEntity> userList = jsonList
      .map<UserEntity>(
        (json) => UserEntity.fromJson(json),
      )
      .toList();

  return Future.value(userList);
}