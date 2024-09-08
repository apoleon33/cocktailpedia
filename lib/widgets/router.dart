import 'package:cocktailpedia/routes/home.dart';
import 'package:flutter/material.dart';

class Router extends StatefulWidget {
  const Router({super.key});

  @override
  State<StatefulWidget> createState() => _RouterState();
}

class _RouterState extends State<Router> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Routes.values.map((e) => e.destination).toList()[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations:
            Routes.values.map((e) => e.navigationDestination).toList(),
      ),
    );
  }
}

enum Routes {
  home(Home(), NavigationDestination(icon: Icon(Icons.home), label: "Home")),
  add(
    SizedBox.shrink(),
    NavigationDestination(
      icon: Icon(Icons.add),
      label: "",
    ),
  ),
  bookmark(
    SizedBox.shrink(),
    NavigationDestination(icon: Icon(Icons.bookmark), label: "Bookmark"),
  );

  final Widget destination;
  final NavigationDestination navigationDestination;

  const Routes(this.destination, this.navigationDestination);
}
