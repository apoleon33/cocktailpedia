import 'package:flutter/material.dart';

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
                    (e) => SingleRecommendation(
                        image: NetworkImage(e.url),
                        name: e.name,
                        author: e.author),
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
  espresso(
      "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/cocktail-espresso-Martini.jpg.webp",
      "Espresso Martini",
      "Adil"),
  frenchMule(
    "https://www.destinationcocktails.fr/wp-content/uploads/2024/06/french-mule.png.webp",
    "French Mule",
    "Simon",
  ),
  kurrantTina(
    "https://www.destinationcocktails.fr/wp-content/uploads/2018/04/Kurrant-tina.jpg.webp",
    "Kurrant Tiña",
    "Clara",
  );

  final String url;
  final String name;
  final String author;

  const ExampleRecommendation(this.url, this.name, this.author);
}

class SingleRecommendation extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String author;

  const SingleRecommendation({
    super.key,
    required this.image,
    required this.name,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: InkWell(
        onTap: () {},
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
                  child: Image(
                    image: image,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Text(
                "By $author",
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
