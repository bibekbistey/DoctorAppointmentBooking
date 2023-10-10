import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/config/router/app_route.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/appointment/domain/entity/appointment_entity.dart';
import 'package:my_app/features/appointment/domain/use_case/appointment_use_case.dart';
import 'package:my_app/features/appointment/presentation/view/appointments.dart';
import 'package:my_app/features/appointment/presentation/viewmodel/appointment_view_model.dart';
import 'package:my_app/features/doctor/domain/entity/doctor_entity.dart';
import 'package:my_app/features/doctor/domain/use_case/doctor_use_case.dart';
import 'package:my_app/features/doctor/presentation/viewmodel/doctor_view_model.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';
import 'package:my_app/features/home/domain/use_case/home_use_case.dart';
import 'package:my_app/features/home/presentation/view/dashboard.dart';
import 'package:my_app/features/home/presentation/viewmodel/home_view_model.dart';

import '../build/app/intermediates/assets/debug/mergeDebugAssets/flutter_assets/test_data/appointment_entity_test.dart';
import '../build/unit_test_assets/test_data/doctor_entity_test.dart';
import '../test/unit_test/appointment_test.mocks.dart';
import '../test/unit_test/doctor_test.mocks.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppointmentUseCase mockAppointmentUseCase;
  late List<AppointmentEntity> appointmentEntity;

  setUpAll(() async {
    mockAppointmentUseCase = MockAppointmentUseCase();
    appointmentEntity = await getAppointments();
  });

  testWidgets('Appointments', (tester) async {
    when(mockAppointmentUseCase.getAppointments())
        .thenAnswer((_) async => Right(appointmentEntity));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appointmentViewModelProvider
              .overrideWith((ref) => AppointmentViewModel(mockAppointmentUseCase)),
        ],
        child: MaterialApp(
          home:AppointmentView()
          // routes: AppRoute.getApplicationRoute(),
          // initialRoute: AppRoute.homeRoute,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Padding), findsWidgets);

    expect(find.byType(ListView), findsWidgets);
    final listViewWidgets = tester.widgetList<ListView>(find.byType(ListView));

    final itemCounts = listViewWidgets
        .map((listView) => listView.childrenDelegate.estimatedChildCount ?? 0)
        .toList();

    expect(itemCounts.length, 1);
  });

  // fail test case

  testWidgets('failed to get Appointments', (tester) async {
    when(mockAppointmentUseCase.getAppointments())
        .thenAnswer((_) async =>  Left(Failure(error: "Invalid")));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appointmentViewModelProvider
              .overrideWith((ref) => AppointmentViewModel(mockAppointmentUseCase)),
        ],
        child: MaterialApp(
          home:AppointmentView()
          // routes: AppRoute.getApplicationRoute(),
          // initialRoute: AppRoute.homeRoute,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Padding), findsWidgets);

    expect(find.byType(ListView), findsWidgets);
    final listViewWidgets = tester.widgetList<ListView>(find.byType(ListView));

    final itemCounts = listViewWidgets
        .map((listView) => listView.childrenDelegate.estimatedChildCount ?? 0)
        .toList();

    expect(itemCounts.length, "Invalid");
  });
}
