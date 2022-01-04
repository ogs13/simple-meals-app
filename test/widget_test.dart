import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:meals_app/main.dart';

void main() {
  testWidgets(
    'main screen widget test',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byKey(Key('bottonNavBarKey')), findsOneWidget);

      expect(find.byKey(Key('categoryGridViewKey')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c1')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c2')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c3')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c4')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c5')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c6')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c7')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c8')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c9')), findsOneWidget);
      expect(find.byKey(Key('categoryItemKey_c10')), findsOneWidget);
    },
  );
  testWidgets('drawer widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    //tap on drawler
    final ScaffoldState managerScreenState =
        tester.firstState(find.byType(Scaffold));
    managerScreenState.openDrawer();

    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    expect(find.byKey(Key('drawerKey')), findsOneWidget);
    expect(find.byKey(Key('listTileDrawerKey0')), findsOneWidget);
    expect(find.byKey(Key('listTileDrawerKey1')), findsOneWidget);
  });

  testWidgets('category screen widget test', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(MyApp());

      expect(find.byKey(Key('categoryItemKey_c1')), findsOneWidget);
      await tester.tap(find.byKey(Key('categoryItemKey_c1')));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(Image), findsOneWidget);
    });
  });
  testWidgets('meal screen widget test', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(MyApp());

      expect(find.byKey(Key('categoryItemKey_c1')), findsOneWidget);
      await tester.tap(find.byKey(Key('categoryItemKey_c1')));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(Image), findsOneWidget);
      expect(find.byKey(Key('mealKeyItem_m1')), findsOneWidget);

      await tester.tap(find.byKey(Key('mealKeyItem_m1')));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(Key('meadDetailsKey')), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byKey(Key('meatTitleKey')), findsOneWidget);
      expect(find.byKey(Key('mealIngredientsKey')), findsOneWidget);
      expect(find.byKey(Key('mealTitleStepsKey')), findsOneWidget);
      expect(find.byKey(Key('mealStepsKey')), findsOneWidget);
      expect(find.byKey(Key('mealFABKey')), findsOneWidget);
    });
  });
}
