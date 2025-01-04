import 'generic_ingredient.dart';

class BrandedIngredient extends GenericIngredient {
  final String brand;

  final double price;

  const BrandedIngredient(super.name, {
    required this.brand,
    this.price = 0.0,
    super.alcoholLevel,
    super.imageProvider,
  });

  @override
  String get formatName => "$brand ($name)";
}