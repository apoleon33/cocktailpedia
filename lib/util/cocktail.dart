import 'package:cocktailpedia/database/api.dart';
import 'package:cocktailpedia/util/glass_type.dart';
import 'package:flutter/material.dart';
import 'package:cocktailpedia/util/base_64_image.dart';

import 'ingredient.dart';

const String defaultDrink =
    "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";

/// The [Cocktail] class gather all the informations about a Cocktail, from it's name or it's author
/// to wether a shaker is needed or not
/// <br>You can find example of Cocktail in the [CocktailDatabase] class.
class Cocktail {
  /// The name of the cocktail.
  final String name;

  final String? author;

  final String description;

  /// The actual recipe, in Markdown format.
  final String recipe;

  /// A link to an image of the cocktail.
  final List<Image> image;
  final List<CocktailIngredient> ingredients;

  final GlassType glassType;

  final bool shakerNeeded;

  static const apiEndpoint = "cocktail";

  const Cocktail({
    required this.name,
    required this.ingredients,
    this.recipe = "",
    required this.image,
    this.author,
    this.glassType = const AnyGlassType(),
    this.shakerNeeded = false,
    this.description = "",
  });

  /// Build A [Cocktail] object from the Api
  factory Cocktail.getFromApi(ApiContent apiContent) => Cocktail(
        name: apiContent.asMap["name"],
        author: apiContent.asMap["author"],
        ingredients: [],
        image: (apiContent.asMap["image"] != null) // No way it works first time
            ? (apiContent.asMap["image"] as List<String>)
                .map((e) => e.decodeBase64Image())
                .toList()
            : [defaultDrink.decodeBase64Image()],
        shakerNeeded: apiContent.asMap["mixing"] == "YES",
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
    return 'Cocktail{name: $name, author: $author, description: $description, recipe: $recipe, image: $image, ingredients: $ingredients, glassType: $glassType, shakerNeeded: $shakerNeeded}';
  }
}
