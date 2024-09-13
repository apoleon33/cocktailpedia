import 'package:cocktailpedia/util/cocktail.dart';
import 'package:flutter/material.dart';

import '../../routes/cocktail.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See all"),
              )
            ],
          ),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ExampleRecommendation.values
                  .map(
                    (e) => SingleRecommendation(e.cocktail),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

enum ExampleRecommendation {
  espresso(Cocktail(
    name: "Espresso Martini",
    author: "Adil",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/cocktail-espresso-Martini.jpg.webp",
    ],
    ingredients: [],
  )),
  frenchMule(Cocktail(
    name: "French Mule",
    author: "Simon",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/french-mule.png.webp",
    ],
    ingredients: [],
  )),
  kurrantTina(Cocktail(
    name: "Kurrant Tiña",
    author: "Clara",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2018/04/Kurrant-tina.jpg.webp"
    ],
    ingredients: [],
  )),
  mary(Cocktail(
    name: "Mary Pickford",
    author: "idk",
    image: [
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/05/mary-pickford-cocktail-2.jpg.webp"
    ],
    ingredients: [],
  ));

  final Cocktail cocktail;

  const ExampleRecommendation(this.cocktail);
}

class SingleRecommendation extends StatelessWidget {
  final Cocktail cocktail;

  const SingleRecommendation(
    this.cocktail, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CocktailPage(cocktail)),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Hero(
                    tag: cocktail,
                    child: Image(
                      image: NetworkImage(cocktail.image![0]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  cocktail.name,
                  textAlign: TextAlign.start,
                  style: textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Text(
                "By ${cocktail.author}",
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
