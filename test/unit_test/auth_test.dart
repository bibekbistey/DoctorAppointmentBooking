// dart run build_runner build --delete-conflicting-outputs

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/auth/domain/entity/student_entity.dart';
import 'package:my_app/features/auth/domain/use_case/auth_usecase.dart';
import 'package:my_app/features/auth/presentation/viewmodel/auth_view_model.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockAuthUsecase = MockAuthUseCase();
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider
            .overrideWith((ref) => AuthViewModel(mockAuthUsecase))
      ],
    );
  });

  //Initial state

  test('check for the initial state', () async {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
  });

  // Login

  test('login test with valid username and password', () async {
    when(mockAuthUsecase.loginStudent('bibek@gmail.com', 'bibek123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(context, 'bibek@gmail.com', 'bibek123');
    //checking the actual state
    final AuthState = container.read(authViewModelProvider);

    expect(AuthState.error, isNull);
  });


   test('register test with valid name, email and password', () async {
    StudentEntity student = const StudentEntity(
        name: 'bibek', email: 'bibek@gmail.com', password: 'bibek123');
    when(mockAuthUsecase.registerStudent(student))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(authViewModelProvider.notifier)
        .registerStudent(student);
    //checking the actual state
    final authState = container.read(authViewModelProvider);

    expect(authState.error, isNull);
  });

  test('login test with username and invalid password', () async {
    when(mockAuthUsecase.loginStudent('bibek@gmail.com', 'bibek123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(context, 'bibek@gmail.com', 'bibek1234');
    //checking the actual state
    final AuthState = container.read(authViewModelProvider);

    expect(AuthState.error, isNull);
  });

  test('check for invalid username and password', () async {
    when(mockAuthUsecase.loginStudent('bibek', 'bibek1234'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

    await container
        .read(authViewModelProvider.notifier)
        .loginStudent(context, 'bibek', 'bibek1234');
    //checking the actual state
    final AuthState = container.read(authViewModelProvider);

    expect(AuthState.error, 'Invalid');
  });

  // Register

 

  // tearDownAll(() {
  //   container.dispose();
  // });
}
