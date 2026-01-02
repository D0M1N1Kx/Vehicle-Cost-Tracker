class Refuel {
  final int fuelQuantity;
  final int fuelCost;
  final DateTime date;

  Refuel({
    required this.fuelQuantity,
    required this.fuelCost,
    required this.date,
  });

  factory Refuel.fromJson(Map<String, dynamic> json) => Refuel(
    fuelQuantity: json['fuelQuantity'],
    fuelCost: json['fuelCost'],
    date: DateTime.parse(json['date'] as String),
  );

  Map<String, dynamic> toJson() => {
    'fuelQuantity': fuelQuantity,
    'fuelCost': fuelCost,
    'date': date.toIso8601String(),
  };
}
