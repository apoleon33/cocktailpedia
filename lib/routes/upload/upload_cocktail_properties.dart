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
            SubsectionWrapper(
              theme: theme,
              headerWrapper: HeaderWrapper(
                text: "Tools",
                icon: Icon(
                  Icons.construction,
                  color: theme.colorScheme.primary,
                ),
              ),
              children: [
                Material(
                  color: Colors.transparent,
                  child: CheckboxListTile(
                    value: isShakerNeeded,
                    onChanged: (bool? status) {
                      setState(() {
                        isShakerNeeded = !isShakerNeeded;
                      });
                    },
                    title: const Text("This cocktail requires a shaker"),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: CheckboxListTile(
                    value: isCocktailSpoonNeeded,
                    onChanged: (bool? status) {
                      setState(() {
                        isCocktailSpoonNeeded = !isCocktailSpoonNeeded;
                      });
                    },
                    title: const Text(
                      "This cocktail requires a cocktail spoon",
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: CheckboxListTile(
                    value: isCocktailStrainerNeeded,
                    onChanged: (bool? status) {
                      setState(() {
                        isCocktailStrainerNeeded = !isCocktailStrainerNeeded;
                      });
                    },
                    title: const Text(
                      "This cocktail requires a cocktail strainer",
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 14.0,
                        left: 14.0,
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Glass type",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            divider,
            SubsectionWrapper(
              headerWrapper: HeaderWrapper(
                text: "Ingredients",
                icon: Icon(
                  Icons.liquor,
                  color: theme.colorScheme.primary,
                ),
              ),
              theme: theme,
              children: const <Widget>[
                Text("SOON :)"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SubsectionWrapper extends StatelessWidget {
  final HeaderWrapper headerWrapper;
  final List<Widget> children;
  final ThemeData theme;

  const SubsectionWrapper({
    super.key,
    required this.headerWrapper,
    required this.theme,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 32.0, left: 32.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: theme.colorScheme.secondaryContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
            child: Column(
              children: [
                headerWrapper,
                Column(
                  children: children,
                )
              ],
            ),
          ),
        ),
      );
}

class HeaderWrapper extends StatelessWidget {
  final Icon icon;
  final String text;

  const HeaderWrapper({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      );
}
