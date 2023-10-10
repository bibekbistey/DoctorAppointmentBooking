import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';
import 'package:my_app/features/home/domain/use_case/home_use_case.dart';
import 'package:my_app/features/home/presentation/viewmodel/home_view_model.dart';


import '../../test_data/doctor_entity_test.dart';
import 'doctor_test.mocks.dart';



@GenerateNiceMocks([
  MockSpec<HomeUseCase>(),
  
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late HomeUseCase mockHomeUseCase;
  late List<HomeEntity> homeEntity;

  setUpAll(() async {
    mockHomeUseCase = MockHomeUseCase();
    homeEntity = await getAllDoctorsTest();
    when(mockHomeUseCase.getAllDoctors())
        .thenAnswer((_) async => const Right([]));
    

    container = ProviderContainer(
      overrides: [
        homeViewModelProvider.overrideWith(
          (ref) => HomeViewModel(mockHomeUseCase),
        )
      ],
    );
  });

  test('check initial state', () async {
    await container.read(homeViewModelProvider.notifier).getAllDoctors();

    final homeState = container.read(homeViewModelProvider);
    expect(homeState.isLoading, false);
    expect(homeState.doctors, isEmpty);
  });

  tearDownAll(() {
    container.dispose();
  });

  test('should get all doctors', () async {
    when(mockHomeUseCase.getAllDoctors())
        .thenAnswer((_) => Future.value(Right(homeEntity)));

    await container.read(homeViewModelProvider.notifier).getAllDoctors();
    final homeState = container.read(homeViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.doctors.length, 2);
  });

  tearDownAll(() {
    container.dispose();
  });

  test('should not get all doctors', () async {
    when(mockHomeUseCase.getAllDoctors())
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

    await container.read(homeViewModelProvider.notifier).getAllDoctors();
    final homeState = container.read(homeViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.error, isNull);
    
  });
  

  
}