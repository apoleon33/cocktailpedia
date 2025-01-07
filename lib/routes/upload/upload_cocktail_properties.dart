import 'package:cocktailpedia/util/cocktail.dart';
import 'package:cocktailpedia/widgets/custom_theme.dart';
import 'package:flutter/material.dart';

class UploadCocktailProperties extends StatefulWidget {
  final Cocktail cocktail;

  const UploadCocktailProperties({super.key, required this.cocktail});

  @override
  State<StatefulWidget> createState() => _UploadCocktailPropertiesStates();
}

class _UploadCocktailPropertiesStates extends State<UploadCocktailProperties> {
  final BorderRadius borderRadius = BorderRadius.circular(16);
  final Padding divider = const Padding(padding: EdgeInsets.all(16));

  bool isShakerNeeded = false;
  bool isCocktailSpoonNeeded = false;
  bool isCocktailStrainerNeeded = false;

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width - 64;
    final double imageHeight = 0.5 * imageWidth;

    return CustomTheme(
      image: widget.cocktail.image[0].image,
      delay: const Duration(milliseconds: 250),
      builder: (ThemeData theme) => Scaffold(
        appBar: AppBar(
          title: Text(widget.cocktail.name),
        ),
        body: ListView(
          children: [
            Center(
              child: Hero(
                tag: "image-0",
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.cocktail.image[0].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            divider,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Icon(
                    Icons.construction,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Tools",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CheckboxListTile(
                  value: isShakerNeeded,
                  onChanged: (bool? status) {
                    setState(() {
                      isShakerNeeded = !isShakerNeeded;
                    });
                  },
                  title: const Text("This cocktail requires a shaker"),
                ),
                CheckboxListTile(
                  value: isCocktailSpoonNeeded,
                  onChanged: (bool? status) {
                    setState(() {
                      isCocktailSpoonNeeded = !isCocktailSpoonNeeded;
                    });
                  },
                  title: const Text("This cocktail requires a cocktail spoon"),
                ),
                CheckboxListTile(
                  value: isCocktailStrainerNeeded,
                  onChanged: (bool? status) {
                    setState(() {
                      isCocktailStrainerNeeded = !isCocktailStrainerNeeded;
                    });
                  },
                  title: const Text("This cocktail requires a cocktail strainer"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
