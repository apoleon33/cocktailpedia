import 'package:cocktailpedia/database/api.dart';
import 'package:cocktailpedia/util/glass_type.dart';

import 'ingredient.dart';

class Cocktail implements ApiConnectivity{
  /// The name of the cocktail.
  final String name;

  final String? author;

  final String description;

  /// The actual recipe, in Markdown format.
  final String recipe;

  /// A link to an image of the cocktail.
  final List<String>? image;
  final List<CocktailIngredient> ingredients;

  final GlassType glassType;

  final bool shakerNeeded;

  const Cocktail({
    required this.name,
    required this.ingredients,
    this.recipe = "",
    this.image,
    this.author,
    this.glassType = const AnyGlassType(),
    this.shakerNeeded = false,
    this.description = "",
  });

  /// Build A [Cocktail] object from the Api
  factory Cocktail.getFromApi(ApiContent apiContent) => Cocktail(
        name: apiContent.content["name"],
        ingredients: apiContent.content["ingredient"],
      );

  /// All the alcoholic ingredients in the cocktail.
  List<GenericIngredient> get alcohols => ingredients
      .where((element) => element.ingredient.isAlcoholic)
      .map((e) => e.ingredient)
      .toList();

  /// The base of a cocktail is the primary spirit or liquor that forms the foundation of the drink.
  List<GenericIngredient> get bases => [];

  /// The sweetener in a cocktail is the ingredient used to add sweetness. It can be a simple syrup, sugar, honey, agave nectar, or even fruit juices.
  List<GenericIngredient> get sweetener => ingredients
      .where((element) => !element.ingredient.isAlcoholic)
      .map((e) => e.ingredient)
      .toList();

  bool get hasDescription => description != "";

  @override
  String toString() {
    return 'Cocktail{name: $name, author: $author, ingredients: $ingredients, glassType: $glassType}';
  }

  @override
  String get endpoint => "";
}
