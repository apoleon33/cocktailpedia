import 'package:flutter/cupertino.dart';

class GenericIngredient {
  final double alcoholLevel;

  /// The name of the ingredient (duh)
  final String name;

  final ImageProvider? imageProvider;

  const GenericIngredient(this.name, {
    this.alcoholLevel = 0.0,
    this.imageProvider,
  });

  bool get isAlcoholic => alcoholLevel != 0.0;

  ImageProvider get image {
    if (imageProvider != null) {
      return imageProvider!;
    } else {
      return (isAlcoholic)
          ? const AssetImage("assets/default_ingredient.png")
          : const AssetImage("assets/default_drink.png");
    }
  }

  String get formatName => name;
}