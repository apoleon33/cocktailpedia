// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cocktailpedia/database/cocktails_db.dart';
import 'package:cocktailpedia/util/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cocktailpedia/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  // Copilot
  group('Cocktail class tests', () {
    test('Cocktail properties', () {
      final cocktail = CocktailDatabase.kurrantTina;

      expect(cocktail.name, 'Kurrant Tiña');
      expect(cocktail.ingredients.length, 5);
      expect(cocktail.glassType.name, 'Whisky');
      expect(cocktail.description, isNotEmpty);
      expect(cocktail.recipe, contains('Préparez vos ingrédients'));
    });

    test('Cocktail ingredient quantities', () {
      final cocktail = CocktailDatabase.kurrantTina;

      expect(cocktail.ingredients[0].quantity.value, 4.0);
      expect(cocktail.ingredients[0].quantity.unit, Unit.cl);
      expect(cocktail.ingredients[4].quantity.value, 4);
      expect(cocktail.ingredients[4].quantity.unit, Unit.wedge);
    });

    test('Cocktail ingredient types', () {
      final cocktail = CocktailDatabase.kurrantTina;

      expect(cocktail.ingredients[0].ingredient.name, 'Cachaça');
      expect(cocktail.ingredients[1].ingredient.name, 'blackcurrant liqueur');
      expect(cocktail.ingredients[2].ingredient.name, 'lime');
      expect(cocktail.ingredients[3].ingredient.name, 'cane');
      expect(cocktail.ingredients[4].ingredient.name, 'greenLime');
    });
  });
}
