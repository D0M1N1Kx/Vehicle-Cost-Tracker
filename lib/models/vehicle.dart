class Vehicle {
  final int id;
  final String brand;
  final String modell;
  final String? engine;
  final int km;
  final String? chassisNumber;
  final String color;
  final String licensePlate;
  final int year;

  Vehicle({
    required this.id,
    required this.brand,
    required this.modell,
    required this.km,
    required this.color,
    required this.licensePlate,
    required this.year,
    this.engine,
    this.chassisNumber,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      brand: json['brand'],
      modell: json['modell'],
      km: json['km'],
      color: json['color'],
      licensePlate: json['licensePlate'],
      year: json['year'],
      engine: json['engine'],
      chassisNumber: json['chassisNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'brand': brand,
    'modell': modell,
    'km': km,
    'color': color,
    'licensePlate': licensePlate,
    'year': year,
    'engine': engine,
    'chassisNumber': chassisNumber,
  };
}
