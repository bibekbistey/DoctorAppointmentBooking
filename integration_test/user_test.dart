import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/failure/failure.dart';
import 'package:my_app/features/user/presentation/view/userlist.dart';
import 'package:my_app/features/user/domain/entity/user_entity.dart';
import 'package:my_app/features/user/domain/use_case/user_use_case.dart';
import 'package:my_app/features/user/presentation/view/userprofile.dart';
import 'package:my_app/features/user/presentation/viewmodel/user_view_model.dart';

import '../test/unit_test/profile_test.mocks.dart';
import '../test_data/profile_entity_test.dart';
import '../test_data/user_entity_test.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserUseCase mockUserUseCase;
  late List<UserEntity> userEntity;

  setUpAll(() async {
    mockUserUseCase = MockUserUseCase();
    userEntity = await getAllUsers();
  });

  testWidgets('User List', (tester) async {
    when(mockUserUseCase.getAllUsers())
        .thenAnswer((_) async => Right(userEntity));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userViewModelProvider
              .overrideWith((ref) => UserViewModel(mockUserUseCase)),
        ],
        child: MaterialApp(
          home:UserListPage()
          // routes: AppRoute.getApplicationRoute(),
          // initialRoute: AppRoute.profileRoute,
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

    
    // expect(find.text('Delete'), findsOneWidget)
   
  });


  // fail test case

  testWidgets('User List', (tester) async {
    when(mockUserUseCase.getAllUsers())
        .thenAnswer((_) async => Left(Failure(error: "Invalid")));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userViewModelProvider
              .overrideWith((ref) => UserViewModel(mockUserUseCase)),
        ],
        child: MaterialApp(
          home:UserListPage()
          // routes: AppRoute.getApplicationRoute(),
          // initialRoute: AppRoute.profileRoute,
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

    
    // expect(find.text('Delete'), findsOneWidget)
   
  });

  

 
}
