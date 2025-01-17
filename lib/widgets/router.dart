import 'package:cocktailpedia/routes/home.dart';
import 'package:cocktailpedia/routes/upload/upload_name_images.dart';
import 'package:cocktailpedia/widgets/custom_navigation_bar.dart';
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
      appBar: const CustomNavigationBar(isColorSurface: false),
      body: Routes.values.map((e) => e.destination).toList()[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          if (index != 1) {
            setState(() {
              currentPageIndex = index;
            });
          } else {
            Navigator.of(context).push(UploadPage.createRoute());
          }
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
    UploadPage(),
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
