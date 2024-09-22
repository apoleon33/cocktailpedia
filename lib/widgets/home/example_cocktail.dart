import '../../util/cocktail.dart';
import '../../util/glass_type.dart';

enum ExampleRecommendation {
  espresso(Cocktail(
    name: "Espresso Martini",
    author: "Adil",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/cocktail-espresso-Martini.jpg.webp",
    ],
    ingredients: [],
    glassType: GlassType(name: "Cocktail"),
    shakerNeeded: true,
    description:
        "Le cocktail Espresso Martini est facile à réaliser. Il se compose de vodka, de café et de sirop de canne.",
  )),
  frenchMule(Cocktail(
    name: "French Mule",
    author: "Simon",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/french-mule.png.webp",
    ],
    ingredients: [],
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
