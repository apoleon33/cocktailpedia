import 'package:cocktailpedia/util/ingredient.dart';
import 'package:flutter/cupertino.dart';

import '../../util/cocktail.dart';
import '../../util/glass_type.dart';

enum ExampleRecommendation {
  espresso(Cocktail(
    name: "Espresso Martini",
    author: "Adil",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/cocktail-espresso-Martini.jpg.webp",
    ],
    ingredients: [
      CocktailIngredient(
        ingredient: GenericIngredient("Vodka", alcoholLevel: 40.0),
        quantity: 5,
      ),
      CocktailIngredient(
        ingredient: BrandedIngredient(
          "Coffee Liqueur",
          brand: "Kahlúa",
          alcoholLevel: 35.0,
          imageProvider: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/a/ac/Kahlua_Bottles_at_Liquor_Store.PNG"),
        ),
        quantity: 3.0,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient("Cane syrup"),
        quantity: 1,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient(
          "Espresso",
          imageProvider: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReDxZ0M0aJ-kUKqFGtc6a6fGi5fGp-Nn0T8w&s"),
        ),
        quantity: 1,
        unit: Unit.unit,
      ),
    ],
    glassType: GlassType(name: "Cocktail"),
    shakerNeeded: true,
    description:
        "Le cocktail Espresso Martini est facile à réaliser. Il se compose de vodka, de café et de sirop de canne.",
  )),
  // ----------------------------------
  frenchMule(Cocktail(
    name: "French Mule",
    author: "Simon",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/french-mule.png.webp",
    ],
    ingredients: [
      CocktailIngredient(
        ingredient: BrandedIngredient(
          "Cognac",
          brand: "Courcel",
          imageProvider: NetworkImage(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.auchan.fr%2FA0219970925000084904PRIMARY_1200x1200%2FB2CD%2F&f=1&nofb=1&ipt=6388f9fdbe4eab3f951a119297d9f8fca8b25f74ced51e47611523988408e74d&ipo=images"),
        ),
        quantity: 4.0,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient("Ginger Beer", alcoholLevel: 1.0),
        quantity: 12.0,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient("Squeezed lime juice "),
        quantity: 2,
      ),
    ],
    glassType: GlassType(name: "Mug"),
    description:
        "Le French Mule est une variante du Moscow Mule. Le French Mule remplace la vodka par du cognac ou de la vodka française. Ce cocktail est parfait pour ceux qui cherchent à explorer de nouvelles saveurs tout en restant fidèles à la tradition des cocktails Mule.",
  )),
  kurrantTina(Cocktail(
    name: "Kurrant Tiña",
    author: "Clara",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2018/04/Kurrant-tina.jpg.webp"
    ],
    ingredients: [],
    glassType: GlassType(name: "Whisky"),
    description:
        "Découvrez le Kurrant Tiña, un cocktail original et délicieux à déguster quand vous le souhaitez !",
  )),
  mary(Cocktail(
    name: "Mary Pickford",
    author: "idk",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/05/mary-pickford-cocktail-2.jpg.webp"
    ],
    ingredients: [],
    glassType: GlassType(name: "Hurricane"),
    shakerNeeded: true,
    description:
        "Le cocktail Mary Pickford à base de rhum blanc est un cocktail fruité alliant sirop de grenadine, liqueur de marasquin et jus d’ananas.",
  ));

  final Cocktail cocktail;

  const ExampleRecommendation(this.cocktail);
}
