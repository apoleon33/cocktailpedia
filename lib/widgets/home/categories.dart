
import 'package:flutter/material.dart';

enum ExampleCategories {
  summer(
      "https://static.vecteezy.com/system/resources/previews/009/266/750/original/sun-icon-design-free-png.png",
      "Summer"),
  ginger("https://cdn-icons-png.flaticon.com/512/1087/1087445.png", "Mule"),
  spritz("https://cdn-icons-png.flaticon.com/512/5295/5295859.png", "Spritz"),
  punch("https://cdn-icons-png.flaticon.com/512/707/707196.png", "Punch"),
  fruits("https://cdn-icons-png.flaticon.com/512/3194/3194591.png", "Fruits");

  final String label;
  final String url;

  const ExampleCategories(this.url, this.label);
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 8.0, left: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See all"),
              )
            ],
          ),
          SizedBox(
            height: 75,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ExampleCategories.values
                  .map((e) => SingleCategory(
                      image: NetworkImage(e.url), label: e.label))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  final ImageProvider image;
  final String label;

  const SingleCategory({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                    width: 24.0, height: 24.0, child: Image(image: image)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(label),
              )
            ],
          ),
        ),
      ),
    );
  }
}