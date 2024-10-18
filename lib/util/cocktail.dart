import 'package:cocktailpedia/database/api.dart';
import 'package:cocktailpedia/util/glass_type.dart';
import 'package:flutter/cupertino.dart';

import 'ingredient.dart';

class Cocktail {
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

  static const apiEndpoint = "cocktail";

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
        name: apiContent.asMap["name"],
        author: apiContent.asMap["author"],
        ingredients: [],
        image: apiContent.asMap["image"] ??
            [
              "https://s2.qwant.com/thumbr/474x474/f/d/aef8498b551e1d0734f6c2df514e2df07f8d87407b7c81c75baf6cffa00a1d/th.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%3Fid%3DOIP.5cSAMaIjiO_2Gg7H05iKQgHaHa%26pid%3DApi&q=0&b=1&p=0&a=0"
            ],
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
    return 'Cocktail{name: $name, author: $author, ingredients: $ingredients, glassType: $glassType}';
  }
}
