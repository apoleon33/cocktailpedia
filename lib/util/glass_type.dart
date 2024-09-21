import 'package:flutter/cupertino.dart';

class GlassType {
  final String name;

  /// A short description of what is the glass, how it is used...
  final String? description;

  const GlassType({required this.name, this.description});

  ImageProvider getImage() =>
      AssetImage("assets/glass-type/${name.toLowerCase()}.png");
}

class AnyGlassType extends GlassType {
  const AnyGlassType() : super(name: "Any");
}
