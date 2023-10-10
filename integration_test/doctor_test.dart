import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/config/router/app_route.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/doctor/domain/entity/doctor_entity.dart';
import 'package:my_app/features/doctor/domain/use_case/doctor_use_case.dart';
import 'package:my_app/features/doctor/presentation/viewmodel/doctor_view_model.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';
import 'package:my_app/features/home/domain/use_case/home_use_case.dart';
import 'package:my_app/features/home/presentation/view/dashboard.dart';
import 'package:my_app/features/home/presentation/viewmodel/home_view_model.dart';

import '../build/unit_test_assets/test_data/doctor_entity_test.dart';
import '../test/unit_test/doctor_test.mocks.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late HomeUseCase mockHomeUseCase;
  late List<HomeEntity> homeEntity;

  setUpAll(() async {
    mockHomeUseCase = MockHomeUseCase();
    homeEntity = await getAllDoctorsTest();
  });

  testWidgets('Dashboard', (tester) async {
    when(mockHomeUseCase.getAllDoctors())
        .thenAnswer((_) async => Right(homeEntity));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeViewModelProvider
              .overrideWith((ref) => HomeViewModel(mockHomeUseCase)),
        ],
        child: MaterialApp(
          home:HomePage()
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

    expect(itemCounts.length, 2);
    expect(itemCounts[1], homeEntity.length);
  });

  // fail test case

  testWidgets('Dashboard', (tester) async {
    when(mockHomeUseCase.getAllDoctors())
        .thenAnswer((_) async =>  Left(Failure(error: "Invalid")));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeViewModelProvider
              .overrideWith((ref) => HomeViewModel(mockHomeUseCase)),
        ],
        child: MaterialApp(
          home:HomePage()
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

    expect(itemCounts.length, 2);
    expect(itemCounts[1], homeEntity.length);
  });
}
