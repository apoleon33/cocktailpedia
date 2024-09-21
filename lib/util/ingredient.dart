abstract class Ingredient {
  final double alcoholLevel;

  /// The name of the ingredient (duh)
  final String name;

  Ingredient(this.alcoholLevel, this.name);

  bool get isAlcoholic => alcoholLevel != 0.0;
}

class BrandedIngredient extends Ingredient {
  final String brand;

  final double price;

  BrandedIngredient(super.name, this.brand, super.alcoholLevel, this.price);
}
