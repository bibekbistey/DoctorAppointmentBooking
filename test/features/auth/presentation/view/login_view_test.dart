import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/config/router/app_route.dart';
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
  late AuthUseCase mockAuthUsecase;

  //we are doing this for dashboard

  late bool isLogin;
  setUpAll(() async {
    mockAuthUsecase = MockAuthUseCase();
    
    isLogin = true;
  });

  testWidgets('login test with username and password ',
      (WidgetTester tester) async {
    when(mockAuthUsecase.loginStudent('bibek@gmail.com', 'bibek'))
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

    await tester.enterText(find.byType(TextFormField).at(0), 'bibek@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'bibek');

    await tester.tap(
      find.widgetWithText(
        ElevatedButton,
        'Login',
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
