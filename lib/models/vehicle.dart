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
}
