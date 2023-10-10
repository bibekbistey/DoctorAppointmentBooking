import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/user/domain/entity/user_entity.dart';
import 'package:my_app/features/user/domain/use_case/user_use_case.dart';
import 'package:my_app/features/user/presentation/viewmodel/user_profile_view_model.dart';

import '../../test_data/profile_entity_test.dart';


import 'profile_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserUseCase>(),
  
])

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late UserUseCase mockUserUseCase;
  late List<UserEntity> userEntity;

  setUpAll(() async {
    mockUserUseCase = MockUserUseCase();
    userEntity = await getUserInfo();
    when(mockUserUseCase.getUserInfo())
        .thenAnswer((_) async => const Right([]));

    container = ProviderContainer(
      overrides: [
        userProfileViewModelProvider.overrideWith(
          (ref) => UserProfileViewModel(mockUserUseCase),
        )
      ],
    );
  });

  test('check profile initial state', () async {
    await container.read(userProfileViewModelProvider.notifier).getUserInfo();

    final userState = container.read(userProfileViewModelProvider);
    expect(userState.isLoading, false);
    expect(userState.users, isEmpty);
  });

  test('Get user profile', () async {
    when(mockUserUseCase.getUserInfo())
        .thenAnswer((_) => Future.value(Right(userEntity)));

    await container.read(userProfileViewModelProvider.notifier).getUserInfo();

    final userState = container.read(userProfileViewModelProvider);

    expect(userState.isLoading, false);
    expect(userState.users.length, 1);
  });

  tearDownAll(() {
    container.dispose();
  });

 

  test('Should not Get User profile', () async {
    when(mockUserUseCase.getUserInfo())
        .thenAnswer((_) => Future.value(Left(Failure(error: "Invalid"))));

    await container.read(userProfileViewModelProvider.notifier).getUserInfo();

    final userState = container.read(userProfileViewModelProvider);

    expect(userState.isLoading, false);
    expect(userState.error, isNull);
   
  });


}
