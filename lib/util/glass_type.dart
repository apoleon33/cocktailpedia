import 'package:flutter/cupertino.dart';

class GlassType implements Comparable<GlassType> {
  final String name;

  /// A short description of what is the glass, how it is used...
  final String? description;

  const GlassType({required this.name, this.description});

  ImageProvider getImage() => AssetImage(
        "assets/glass-type/${name.toLowerCase()}.png",
      );

  /// A list of all existing glass types, or at least the ones with an icon associated.
  static List<GlassType> get glassTypes {
    List<GlassType> glassTypeList = [
      const AnyGlassType(),
      const GlassType(name: "Cocktail"),
      const GlassType(name: "Hurricane"),
      const GlassType(name: "Whisky"),
      const GlassType(name: "Mug"),
      const GlassType(name: "Wine"),
      const GlassType(name: "Pint"),
      const GlassType(name: "Margarita"),
      const GlassType(name: "sling"),
      const GlassType(name: "tasting"),
    ];
    // alphabetical order
    glassTypeList.sort((a, b) => a.compareTo(b));
    return glassTypeList;
  }

  @override
  String toString() {
    return 'GlassType{name: $name, description: $description}';
  }

  @override
  int compareTo(GlassType other) => name.compareTo(other.name);
}

class AnyGlassType extends GlassType {
  const AnyGlassType() : super(name: "Any");
}
