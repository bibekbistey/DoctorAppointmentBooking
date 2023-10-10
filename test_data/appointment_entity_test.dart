import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_app/features/appointment/domain/entity/appointment_entity.dart';
import 'package:my_app/features/doctor/domain/entity/doctor_entity.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';


Future<List<AppointmentEntity>> getAppointments() async {
  final response =
      await rootBundle.loadString('test_data/appointment_test_data.json');
  final jsonList = await json.decode(response);
  final List<AppointmentEntity> appointmentList = jsonList
      .map<AppointmentEntity>(
        (json) => AppointmentEntity.fromJson(json),
      )
      .toList();

  return Future.value(appointmentList);
}
