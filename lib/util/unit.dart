class Quantity {
  /// The brut quantity, in mL if applicable.
  final double _value;

  Unit unit;

  Quantity(this._value, this.unit);

  void convert(Unit newUnit) {
    unit = (unit.conversionRate != null) ? newUnit : unit;
  }

  double get value => _value * (unit.conversionRate ?? 1);

  String get formatQuantity => (value != 0.0) ? "$value $unit" : "";
}

enum Unit {
  ml(1),
  cl(10),
  wedge(null, isPluralDifferent: true),
  unit(null, isPluralDifferent: true),
  oz(29.5735), // roughly
  shot(400, isPluralDifferent: true);

  /// Quotient to get the unit converted in mL
  /// default to [null] if no conversion is possible
  final double? conversionRate;

  final bool isPluralDifferent;

  const Unit(this.conversionRate, {this.isPluralDifferent = false});

  @override
  String toString() => (name != "unit") ? name : "";
}
