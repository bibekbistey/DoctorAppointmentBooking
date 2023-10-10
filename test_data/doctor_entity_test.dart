import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_app/features/doctor/domain/entity/doctor_entity.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';


Future<List<HomeEntity>> getAllDoctorsTest() async {
  final response =
      await rootBundle.loadString('test_data/doctor_test_data.json');
  final jsonList = await json.decode(response);
  final List<HomeEntity> doctorList = jsonList
      .map<HomeEntity>(
        (json) => HomeEntity.fromJson(json),
      )
      .toList();

  return Future.value(doctorList);
}
