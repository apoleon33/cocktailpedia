import 'package:cocktailpedia/util/cocktail.dart';
import 'package:cocktailpedia/widgets/shimmer.dart';
import 'package:flutter/material.dart';

import '../../database/api.dart';
import '../../routes/cocktail_page.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key});

  @override
  State<StatefulWidget> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
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
              children: const [
                SingleRecommendation(cocktailId: 0),
                SingleRecommendation(cocktailId: 1)
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// How a single cocktail is displayed in the "Recommendation" tab of the home.
class SingleRecommendation extends StatefulWidget {
  final int cocktailId;

  const SingleRecommendation({super.key, required this.cocktailId});

  @override
  State<StatefulWidget> createState() => SingleRecommendationState();
}

class SingleRecommendationState extends State<SingleRecommendation> {
  Cocktail? cocktail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _getCocktailFromApi();
    });
  }

  void _getCocktailFromApi() async {
    cocktail = Cocktail.getFromApi(
      await Api.getFromApi(
        Cocktail.apiEndpoint,
        {'id': widget.cocktailId},
      ),
    );
    print("found cocktail in api!");
    setState(() {});
  }

  /// Not directly in the [build] method to avoid null checks and for more readability.
  Widget _displayCocktail(BuildContext context, Cocktail cocktail) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    print(cocktail);
    precacheImage(NetworkImage(cocktail.image![0]), context);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CocktailPage(cocktail)),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: AspectRatio(
          aspectRatio: 165 / 250,
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
      ),
    );
  }

  /// Bascially [_displayCocktail], but with black squares instead of the image, name and author
  Widget _displayShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: ShimmerLoading(
        child: AspectRatio(
          aspectRatio: 165 / 250,
          child: SizedBox(
            height: 252,
            //width: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Container(
                    height: 18,
                    //width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Container(
                    height: 12,
                    //width: 75,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cocktail != null) {
      return _displayCocktail(context, cocktail!);
    } else {
      return _displayShimmer(context);
    }
  }
}
