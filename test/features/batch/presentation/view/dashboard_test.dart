// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:my_app/config/router/app_route.dart';

// import '../../../../../test_data/batch_entity_test.dart';
// import '../../../../unit_test/batch_test.mocks.dart';

// class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
//   @override
//   bool get overrideHttpClient => false;
// }

// void main() {
//   CustomBindings();
//   late DoctorUseCase mockDoctorUseCase;
//   late List<DoctorEntity> doctorEntity;

//   setUpAll(() async {
//     mockDoctorUseCase = MockDoctorUseCase();
//     doctorEntity = await getDoctorListTest();
//   });

//   testWidgets('Dashboard View', (tester) async {
//     when(mockDoctorUseCase.getAllDoctors())
//         .thenAnswer((_) async => Right(doctorEntity));

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           doctorViewModelProvider
//               .overrideWith((ref) => DoctorViewModel(mockDoctorUseCase)),
//         ],
//         child: MaterialApp(
//           routes: AppRoute.getApplicationRoute(),
//           initialRoute: AppRoute.doctorRoute,
//         ),
//       ),
//     );

//     await tester.pumpAndSettle();

//     expect(find.byType(Padding), findsWidgets);

//     // expect(find.byType(ListView), findsWidgets);
//     // final listViewWidgets = tester.widgetList<ListView>(find.byType(ListView));

//     // final itemCounts = listViewWidgets
//     //     .map((listView) => listView.childrenDelegate.estimatedChildCount ?? 0)
//     //     .toList();

//     // expect(itemCounts.length, 4);
//     // expect(itemCounts[1], doctorEntity.length);
//   });
// }
