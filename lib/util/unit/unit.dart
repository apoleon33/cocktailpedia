import 'formatQuantity.dart';

enum Unit {
  ml(1),
  cl(1 / 10),
  wedge(null, formatQuantity: FormatPlural()),
  unit(null, formatQuantity: FormatUnit()),
  oz(1 / 29.5735), // roughly
  shot(1 / 30, formatQuantity: DisplayAsFraction());

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