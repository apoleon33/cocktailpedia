import 'package:cocktailpedia/util/glass_type.dart';

import 'ingredient.dart';

class Cocktail {
  /// The name of the cocktail.
  final String name;

  final String? author;

  /// A link to an image of the cocktail.
  final List<String>? image;
  final List<Ingredient> ingredients;

  final GlassType glassType;

  final bool shakerNeeded;

  const Cocktail({
    required this.name,
    required this.ingredients,
    this.image,
    this.author,
    this.glassType = const AnyGlassType(),
    this.shakerNeeded = false,
  });

  /// All the alcoholic ingredients in the cocktail.
  List<Ingredient> get alcohols =>
      ingredients.where((element) => element.isAlcoholic).toList();

  /// The base of a cocktail is the primary spirit or liquor that forms the foundation of the drink.
  List<Ingredient> get bases => [];

  /// The sweetener in a cocktail is the ingredient used to add sweetness. It can be a simple syrup, sugar, honey, agave nectar, or even fruit juices.
  List<Ingredient> get sweetener =>
      ingredients.where((element) => !element.isAlcoholic).toList();

  @override
  String toString() {
    return 'Cocktail{name: $name, author: $author, ingredients: $ingredients, glassType: $glassType}';
  }
}
