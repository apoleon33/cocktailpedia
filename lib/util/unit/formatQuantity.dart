import 'package:cocktailpedia/util/unit/quantity.dart';

/// How a quantity should be displayed
abstract class FormatQuantity {
  const FormatQuantity();

  String formatQuantity(Quantity quantity);

  /// In case nothing should be displayed.
  static String formatEmptyQuantity() => "";
}

/// How a quantity of things (generally non-liquids) should be displayed,
/// it is usually like this: `quantity`.
/// <br>The quantity is rounded to it's first 2 digits
/// <br>ex: `2`
class FormatUnit extends FormatQuantity {
  const FormatUnit();

  @override
  String formatQuantity(Quantity quantity) => quantity.value.toStringAsFixed(2);
}

/// The default way a quantity is displayed,
/// it is usually like this: `value unit`.
/// <br> ex: `15 mL`
class DefaultFormat extends FormatQuantity {
  const DefaultFormat();

  @override
  String formatQuantity(Quantity quantity) =>
      "${quantity.formattedValue} ${quantity.unit}";
}

/// Some units needs an "s" added when the quantity is bigger than 1.
class FormatPlural extends DefaultFormat {
  const FormatPlural();

  @override
  String formatQuantity(Quantity quantity) =>
      "${super.formatQuantity(quantity)}${quantity.value > 1 ? "s" : ""}";
}

class DisplayAsFraction extends FormatQuantity {
  const DisplayAsFraction();
  @override
  String formatQuantity(Quantity quantity){
    // "⁄"
    return "${(quantity.value).toStringAsFixed(2)} shot${quantity.value > 1 ? "s" : ""}";
  }

}