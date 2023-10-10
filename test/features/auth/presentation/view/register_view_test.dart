import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/config/router/app_route.dart';
import 'package:my_app/features/auth/domain/entity/student_entity.dart';
import 'package:my_app/features/auth/domain/use_case/auth_usecase.dart';
import 'package:my_app/features/auth/presentation/viewmodel/auth_view_model.dart';

import '../../../../unit_test/auth_test.mocks.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;

  late StudentEntity authEntity;

  setUpAll(
    () async {
      mockAuthUsecase = MockAuthUseCase();

      authEntity = const StudentEntity(
        name: 'bibek',
        email: 'bibek@123gmail.com',
        password: 'bibek',
      );
    },
  );

  testWidgets('register view ...', (tester) async {
    when(mockAuthUsecase.registerStudent(authEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockAuthUsecase),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.registerRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Enter mnajesh in first textform field

    await tester.enterText(find.byType(TextFormField).at(0), 'bibek');

    // Enter manjesh in second textform field

    await tester.enterText(
        find.byType(TextFormField).at(1), 'bibek@123gmail.com');

    await tester.enterText(find.byType(TextFormField).at(2), 'bibek');

    //=========================== Find the dropdownformfield===========================

    //=========================== Find the register button===========================

    // final registerButtonFinder =
    //     find.widgetWithText(ElevatedButton, 'Register');

    // await tester.dragUntilVisible(
    //   registerButtonFinder, // what you want to find

    //   find.byType(SingleChildScrollView), // widget you want to scroll

    //   const Offset(196.4, 734.3), // delta to move
    // );

    // await tester.tap(registerButtonFinder);

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'Register'),
    );

    await tester.pumpAndSettle();

    // Check weather the snackbar is displayed or not

    expect(find.widgetWithText(SnackBar, 'Registered successfully'),
        findsOneWidget);

    // expect(find.text('SIGN IN'), findsOneWidget);
  });
}
