class Cocktail {
  /// The name of the cocktail.
  final String name;

  final String? author;

  /// A link to an image of the cocktail.
  final List<String>? image;
  final List<Ingredient> ingredients;

  const Cocktail({
    required this.name,
    required this.ingredients,
    this.image,
    this.author,
  });

  /// Get all the alcohols in the cocktail.
  List<Ingredient> get alcohols => [];

  /// The base of a cocktail is the primary spirit or liquor that forms the foundation of the drink.
  List<Ingredient> get bases => [];

  /// The sweetener in a cocktail is the ingredient used to add sweetness. It can be a simple syrup, sugar, honey, agave nectar, or even fruit juices.
  List<Ingredient> get sweetener => [];

  @override
  String toString() {
    return 'Cocktail{name: $name, image: $image, ingredients: $ingredients}';
  }
}

abstract class Ingredient {
  final double alcoholLevel;

  /// The name of the ingredient (duh)
  /// Idk if the brand is in this.
  final String name;

  Ingredient(this.alcoholLevel, this.name);

  bool get isAlcoholic => alcoholLevel != 0.0;
}
