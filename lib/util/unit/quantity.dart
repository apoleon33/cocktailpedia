import 'package:cocktailpedia/util/unit/unit.dart';

import 'format_quantity.dart';

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