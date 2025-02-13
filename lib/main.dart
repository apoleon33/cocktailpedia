import 'package:cocktailpedia/widgets/router.dart';
import 'package:flutter/material.dart' hide Router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktailpedia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: MediaQuery.of(context).platformBrightness
        ),
        useMaterial3: true,
      ),
      home: const Router(),
    );
  }
}
