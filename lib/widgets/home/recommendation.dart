import 'package:cocktailpedia/util/cocktail.dart';
import 'package:cocktailpedia/util/glass_type.dart';
import 'package:flutter/material.dart';

import '../../routes/cocktail_page.dart';
import 'example_cocktail.dart';

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
