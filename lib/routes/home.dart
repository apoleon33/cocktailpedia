import 'package:cocktailpedia/widgets/home/recommendation.dart';
import 'package:flutter/material.dart';

import '../widgets/home/categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            trailing: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.tune),
              ),
            ],
            hintText: "Mojito, Gin...",
          ),
          const Categories(),
          const Recommendation(),
        ],
      ),
    );
  }
}
