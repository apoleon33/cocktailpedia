import 'package:cocktailpedia/util/ingredient.dart';
import 'package:flutter/cupertino.dart';

import '../../util/cocktail.dart';
import '../../util/glass_type.dart';

const GenericIngredient lime = GenericIngredient("Squeezed lime juice ");
const GenericIngredient cane = GenericIngredient("Cane syrup");
const GenericIngredient greenLime = GenericIngredient(
  "Fresh Lime",
  imageProvider: NetworkImage(
    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcairofruit.com%2Fwp-content%2Fuploads%2F2020%2F10%2Ffresh-lime-with-leaf-white-background_55883-5.jpg&f=1&nofb=1&ipt=751d2ff277da67b9c8177affd33f961f34bf0110d63af662d77a543e6ce4ba53&ipo=images",
  ),
);

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
        ingredient: cane,
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
        "The Espresso Martini cocktail is easy to make. It's made with vodka, coffee and cane syrup.",
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
        ingredient: lime,
        quantity: 2,
      ),
      CocktailIngredient(
        ingredient: greenLime,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient(
          "Fresh Mint",
          imageProvider: NetworkImage(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fagentfresh.com.au%2Fwp-content%2Fuploads%2F2021%2F01%2FMint-1024x866.jpg&f=1&nofb=1&ipt=581112c4accdc80ef4b3f969be554ab5973383634fb39936bdc2de502c7072f4&ipo=images"),
        ),
      ),
    ],
    glassType: GlassType(name: "Mug"),
    description:
        "The French Mule is a variant of the Moscow Mule. The French Mule replaces the vodka with cognac or French vodka. This cocktail is perfect for those looking to explore new flavours while staying true to the Mule cocktail tradition.",
  )),
  // ------------------------------------------------------------
  kurrantTina(Cocktail(
    name: "Kurrant Tiña",
    author: "Clara",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2018/04/Kurrant-tina.jpg.webp"
    ],
    ingredients: [
      CocktailIngredient(
        ingredient: GenericIngredient(
          "Cachaça",
          alcoholLevel: 42.0,
          imageProvider: NetworkImage(
            "https://m.media-amazon.com/images/I/51fExBHBIhL.jpg",
          ),
        ),
        quantity: 4.0,
      ),
      CocktailIngredient(
        ingredient:
            GenericIngredient("blackcurrant liqueur", alcoholLevel: 15.0),
        quantity: 2.0,
      ),
      CocktailIngredient(ingredient: lime, quantity: 6.0),
      CocktailIngredient(ingredient: cane, quantity: 1.0),
      CocktailIngredient(ingredient: greenLime, quantity: 4, unit: Unit.wedges),
    ],
    glassType: GlassType(name: "Whisky"),
    description:
        "Discover Kurrant Tiña, an original and delicious cocktail to enjoy whenever you like!",
  )),
  // --------------------------------------------------------------------
  mary(Cocktail(
    name: "Mary Pickford",
    author: "idk",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/05/mary-pickford-cocktail-2.jpg.webp"
    ],
    ingredients: [
      CocktailIngredient(
        ingredient: GenericIngredient(
          "White rum",
          alcoholLevel: 40.0,
          imageProvider: NetworkImage(
            "https://www.xo-vin.fr/4204-thickbox_default/000195013-saint-james-rhum-agricole-blanc-imperial-40_.jpg",
          ),
        ),
        quantity: 4.5,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient("Pineapple juice"),
        quantity: 4.5,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient(
          "Marasquin",
          alcoholLevel: 25.0,
          imageProvider: NetworkImage(
            "https://premiumliqueur.com/1173-large_default/liqueur-de-marasquin-vedrenne-25-70cl.jpg",
          ),
        ),
        quantity: 0.7,
      ),
      CocktailIngredient(
        ingredient: GenericIngredient("Grenadine syrup"),
        quantity: 0.5,
      ),
    ],
    glassType: GlassType(name: "Hurricane"),
    shakerNeeded: true,
    description:
        "The Mary Pickford white rum cocktail is a fruity cocktail combining grenadine syrup, maraschino liqueur and pineapple juice.",
  ));

  final Cocktail cocktail;

  const ExampleRecommendation(this.cocktail);
}
