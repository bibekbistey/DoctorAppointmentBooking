import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/config/router/app_route.dart';
import 'package:my_app/features/auth/domain/use_case/auth_usecase.dart';
import 'package:my_app/features/auth/presentation/viewmodel/auth_view_model.dart';

import '../test/unit_test/auth_test.mocks.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthUseCase mockAuthUsecase;

  //we are doing this for dashboard

  late bool isLogin;

  setUpAll(() async {
    mockAuthUsecase = MockAuthUseCase();

    isLogin = true;
  });

  testWidgets('login test with username and password and open dashboard',
      (WidgetTester tester) async {
    when(mockAuthUsecase.loginStudent('nischal', 'nischal123'))
        .thenAnswer((_) async => Right(isLogin));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUsecase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'nischal');
    await tester.enterText(find.byType(TextFormField).at(1), 'nischal123');

    await tester.tap(
      find.widgetWithText(
        ElevatedButton,
        'Login',
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsWidgets);
  });

  tearDownAll(() {
    // container.dispose();
  });

  

 
}
