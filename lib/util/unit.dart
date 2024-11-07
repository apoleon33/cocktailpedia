class Quantity {
  /// The brut quantity, in mL if applicable.
  final double _value;

  Unit unit;

  Quantity(this._value, this.unit);

  void convert(Unit newUnit) {
    unit = (unit.conversionRate != null) ? newUnit : unit;
  }

  double get value => _value * (unit.conversionRate ?? 1);

  String get formattedValue => value.toStringAsFixed(2);

  String get formatQuantity => (value != 0.0)
      ? unit.formatQuantity.formatQuantity(this)
      : FormatQuantity.formatEmptyQuantity();
}

enum Unit {
  ml(1),
  cl(1 / 10),
  wedge(null),
  unit(null, formatQuantity: FormatUnit()),
  oz(1 / 29.5735), // roughly
  shot(1 / 40);

  /// Quotient to get the unit converted in mL
  /// default to [null] if no conversion is possible
  final double? conversionRate;

  final FormatQuantity formatQuantity;

  const Unit(
    this.conversionRate, {
    this.formatQuantity = const DefaultFormat(),
  });

  @override
  String toString() => name;
}

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
