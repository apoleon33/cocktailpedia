import 'package:cocktailpedia/util/unit/quantity.dart';

import 'generic_ingredient.dart';


/// While the [GenericIngredient] class describe in a general manner, well, an ingredient, the [CocktailIngredient] class describe it as it's used in the cocktail.
class CocktailIngredient {
  final bool isBase;
  final GenericIngredient ingredient;

  final Quantity quantity;

  const CocktailIngredient({
    required this.ingredient,
    required this.quantity,
    this.isBase = false,
  });

  String get formatQuantity => quantity.formatQuantity;
}
