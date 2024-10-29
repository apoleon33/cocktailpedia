class Quantity implements Comparable<Quantity>{

  /// The brut quantity, in mL if applicable.
  final double _value;


  Unit unit;

  Quantity(this.value, this.unit);

  void convert(Unit newUnit){
    unit = (unit != null)? newUnit: unit;
  }

  double get value => _value * unit.conversionRate ?? 1;

  String get formatQuantity => (quantity != 0.0) ? "$value $unit${unit.}" : "";
}

enum Unit {
  ml(1),
  cl(10),
  wedge(null, true),
  unit(null, true),
  oz(29.5735), // roughly
  shot(400, true); 

  /// Quotient to get the unit converted in mL
  /// default to [null] if no conversion is possible
  final double? conversionRate;

  final bool isPluralDifferent;

  const Unit(this.conversionRate, isPluralDifferent= false);

  @override
  String toString() => (name != "unit") ? name : "";
}

