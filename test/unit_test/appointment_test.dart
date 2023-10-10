import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/appointment/domain/entity/appointment_entity.dart';
import 'package:my_app/features/appointment/domain/use_case/appointment_use_case.dart';
import 'package:my_app/features/appointment/presentation/viewmodel/appointment_view_model.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';
import 'package:my_app/features/home/domain/use_case/home_use_case.dart';
import 'package:my_app/features/home/presentation/viewmodel/home_view_model.dart';


import '../../test_data/appointment_entity_test.dart';
import '../../test_data/doctor_entity_test.dart';

import 'appointment_test.mocks.dart';



@GenerateNiceMocks([
  MockSpec<AppointmentUseCase>(),
  
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late AppointmentUseCase mockAppointmentUseCase;
  late List<AppointmentEntity> appointmentEntity;

  setUpAll(() async {
    mockAppointmentUseCase = MockAppointmentUseCase();
    appointmentEntity = await getAppointments();
    when(mockAppointmentUseCase.getAppointments())
        .thenAnswer((_) async => const Right([]));
    

    container = ProviderContainer(
      overrides: [
        appointmentViewModelProvider.overrideWith(
          (ref) => AppointmentViewModel(mockAppointmentUseCase),
        )
      ],
    );
  });

  test('check initial state', () async {
    await container.read(appointmentViewModelProvider.notifier).getAppointments();

    final appointmentState = container.read(appointmentViewModelProvider);
    expect(appointmentState.isLoading, false);
    expect(appointmentState.appointments, isEmpty);
  });

  test('Get appointments', () async {
    when(mockAppointmentUseCase.getAppointments())
        .thenAnswer((_) => Future.value(Right(appointmentEntity)));

    await container.read(appointmentViewModelProvider.notifier).getAppointments();

    final appointmentState = container.read(appointmentViewModelProvider);

    expect(appointmentState.isLoading, false);
    expect(appointmentState.appointments.length, 3);
  });

  tearDownAll(() {
    container.dispose();
  });

  test('should not Get appointments', () async {
    when(mockAppointmentUseCase.getAppointments())
        .thenAnswer((_) => Future.value(Left(Failure(error: "Invalid"))));

    await container.read(appointmentViewModelProvider.notifier).getAppointments();

    final appointmentState = container.read(appointmentViewModelProvider);

    expect(appointmentState.isLoading, false);
    expect(appointmentState.error, isNull);
    
  });

  tearDownAll(() {
    container.dispose();
  });

  
}