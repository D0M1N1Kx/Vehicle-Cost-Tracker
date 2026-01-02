import 'package:vehicle_cost_tracker_app/models/refuel.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';

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
  final List<Refuel>? refuels;

  final List<Service>? services;

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
    this.refuels,
    this.services,
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
      refuels: json['refuels'] != null
          ? (json['refuels'] as List)
                .map((i) => Refuel.fromJson(i as Map<String, dynamic>))
                .toList()
          : null,
      services: json['services'] != null
          ? (json['services'] as List)
                .map((i) => Service.fromJson(i as Map<String, dynamic>))
                .toList()
          : null,
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
    'refuels': refuels?.map((r) => r.toJson()).toList(),
    'services': services?.map((s) => s.toJson()).toList(),
  };
}
