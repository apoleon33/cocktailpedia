import 'package:flutter/cupertino.dart';

class GlassType {
  final String name;

  /// A short description of what is the glass, how it is used...
  final String? description;

  const GlassType({required this.name, this.description});

  ImageProvider getImage() =>
      AssetImage("assets/glass-type/${name.toLowerCase()}.png");

  @override
  String toString() {
    return 'GlassType{name: $name, description: $description}';
  }
}

class AnyGlassType extends GlassType {
  const AnyGlassType() : super(name: "Any");
}
