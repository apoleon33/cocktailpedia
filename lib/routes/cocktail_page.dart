import 'package:cocktailpedia/util/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailPage(this.cocktail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: cocktail,
            child: Image(
              image: NetworkImage(cocktail.image![0]),
            ),
          ),
          CustomBottomSheet(cocktail),
        ],
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

  final EdgeInsets _margin = const EdgeInsets.only(right: 16.0, left: 16.0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

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
      initialChildSize: 0.5,
      maxChildSize: 1,
      minChildSize: 0.5,
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
                  Padding(
                    padding: _margin,
                    child: Text(
                      "By ${widget.cocktail.author}",
                      style: textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
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
