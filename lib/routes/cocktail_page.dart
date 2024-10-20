import 'package:cocktailpedia/util/cocktail.dart';
import 'package:cocktailpedia/widgets/cocktail_page/ingredient_formatter.dart';
import 'package:cocktailpedia/widgets/custom_theme.dart';
import 'package:flutter/material.dart';

//import 'package:markdown_widget/markdown_widget.dart';

class CocktailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailPage(this.cocktail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTheme(
        image: cocktail.image[0].image,
        child: Stack(
          children: [
            Hero(
              tag: cocktail,
              child: Image(
                image: cocktail.image[0].image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
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
            CustomBottomSheet(cocktail),
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
    if (currentSize <= 0.35) _goToHalf();
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
      initialChildSize: 0.25,
      maxChildSize: 1,
      minChildSize: 0.25,
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
                          children: [
                            Text(
                              "Ingredients",
                              style: textTheme.titleLarge,
                            ),
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
