import 'package:flutter/material.dart';

class GenericIngredient {
  final double alcoholLevel;

  /// The name of the ingredient (duh)
  final String name;

  final ImageProvider? imageProvider;

  const GenericIngredient(
    this.name, {
    this.alcoholLevel = 0.0,
    this.imageProvider,
  });

  bool get isAlcoholic => alcoholLevel != 0.0;

  ImageProvider get image {
    if (imageProvider != null) {
      return imageProvider!;
    } else {
      return (isAlcoholic)
          ? const AssetImage("assets/default_ingredient.png")
          : const AssetImage("assets/default_drink.png");
    }
  }

  String get formatName => name;
}

class BrandedIngredient extends GenericIngredient {
  final String brand;

  final double price;

  const BrandedIngredient(
    super.name, {
    required this.brand,
    this.price = 0.0,
    super.alcoholLevel,
    super.imageProvider,
  });

  @override
  String get formatName => "$brand ($name)";
}

/// While the [GenericIngredient] class describe in a general manner, well, an ingredient, the [CocktailIngredient] class describe it as it's used in the cocktail.
class CocktailIngredient {
  final bool isBase;
  final GenericIngredient ingredient;

  final double quantity;
  final Unit unit;

  const CocktailIngredient({
    required this.ingredient,
    this.quantity = 0.0,
    this.unit = Unit.cl,
    this.isBase = false,
  });

  String get formatQuantity => ;

  @override
  String toString() {
    return 'CocktailIngredient{isBase: $isBase, ingredient: $ingredient, unit: $unit}';
  }
}
