import 'package:cocktailpedia/util/cocktail.dart';
import 'package:cocktailpedia/util/ingredient.dart';
import 'package:cocktailpedia/util/unit/unit.dart';
import 'package:cocktailpedia/widgets/cocktail_page/ingredient_formatter.dart';
import 'package:cocktailpedia/widgets/custom_theme.dart';
import 'package:flutter/material.dart';

//import 'package:markdown_widget/markdown_widget.dart';
class CocktailPage extends StatefulWidget {
  final Cocktail cocktail;

  const CocktailPage({super.key, required this.cocktail});

  @override
  State<StatefulWidget> createState() => _CocktailPageState();
}

class _CocktailPageState extends State<CocktailPage> {
  final ScrollController _imageScrollController = ScrollController();
  bool isScrollingImage = false;

  @override
  void initState() {
    super.initState();
    _imageScrollController.addListener(() {
      isScrollingImage = !isScrollingImage;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _imageScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTheme(
        image: widget.cocktail.image[0].image,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: _imageScrollController,
                    children: widget.cocktail.image
                        .map((e) => Hero(
                              tag: e.image,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: e.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 56.0, left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filledTonal(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_outline_outlined),
                  ),
                ],
              ),
            ),
            CustomBottomSheet(widget.cocktail),
          ],
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  final Cocktail cocktail;

  const CustomBottomSheet(this.cocktail, {super.key});

  @override
  State<StatefulWidget> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  /// Uniform padding for every of [SliverList.list]'s children.
  final EdgeInsets _margin = const EdgeInsets.only(right: 16.0, left: 16.0);

  Unit currentUnit = Unit.cl;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _goToHalf();
    });
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
    //if (currentSize <= 0.35) _goToHalf();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _goToHalf() => _controller.animateTo(0.5,
      duration: const Duration(milliseconds: 200), curve: Curves.linear);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _changeUnit(Unit newUnit) {
    for (CocktailIngredient element in widget.cocktail.ingredients) {
      element.quantity.convert(newUnit);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return DraggableScrollableSheet(
      key: _sheet,
      controller: _controller,
      initialChildSize: 0.4,
      maxChildSize: 1,
      minChildSize: 0.4,
      expand: true,
      snap: true,
      snapSizes: const [0.5],
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (_controller.size <= 0.75) {
                            _expand();
                          } else {
                            _hide();
                          }
                        },
                        icon: const Icon(Icons.drag_handle))
                  ],
                ),
              ),
              SliverList.list(
                children: [
                  // Title
                  Padding(
                    padding: _margin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cocktail.name,
                          style: textTheme.titleLarge,
                        ),
                        // stars soon
                      ],
                    ),
                  ),
                  // Author
                  Padding(
                    padding: _margin,
                    child: Text(
                      "By ${widget.cocktail.author}",
                      style: textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                  // Glass Type and shaker
                  Padding(
                    padding: _margin,
                    child: Row(
                      children: [
                        ActionChip(
                          onPressed: () {},
                          label:
                              Text("${widget.cocktail.glassType.name} Glass"),
                          avatar: Image(
                            image: widget.cocktail.glassType.getImage(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ActionChip(
                            onPressed: () {},
                            label: Text(
                              "${widget.cocktail.shakerNeeded ? "S" : "No s"}haker needed",
                            ),
                            avatar: widget.cocktail.shakerNeeded
                                ? const Image(
                                    image: AssetImage("assets/shaker.png"))
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),

                  // Description
                  Padding(
                    padding: _margin.copyWith(top: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Description",
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Text(
                          (widget.cocktail.hasDescription)
                              ? widget.cocktail.description
                              : "No description available.",
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  // Ingredients
                  Padding(
                    padding: _margin.copyWith(
                      top: 16.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ingredients",
                              style: textTheme.titleLarge,
                            ),
                            MenuAnchor(
                                menuChildren: Unit.values
                                    .where((element) =>
                                        element.conversionRate != null)
                                    .map((e) => MenuItemButton(
                                          onPressed: () {
                                            currentUnit = e;
                                            _changeUnit(e);
                                            setState(() {});
                                          },
                                          child: Text(e.toString()),
                                        ))
                                    .toList(),
                                builder: (
                                  _,
                                  controller,
                                  child,
                                ) {
                                  return TextButton(
                                    onPressed: () {
                                      if (controller.isOpen) {
                                        controller.close();
                                      } else {
                                        controller.open();
                                      }
                                    },
                                    child: Text(
                                      currentUnit.toString(),
                                    ),
                                  );
                                }),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: widget.cocktail.ingredients
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: IngredientFormatter(e),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Recipe
                  Padding(
                    padding: _margin.copyWith(top: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Recipe",
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                        //MarkdownBlock(data: widget.cocktail.recipe),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
