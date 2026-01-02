import 'package:vehicle_cost_tracker_app/models/service_type.dart';

class Service {
  final ServiceType type;
  final int cost;
  final DateTime date;

  Service({required this.type, required this.cost, required this.date});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    type: ServiceType.values.firstWhere(
      (e) => e.toString().split('.').last == json['type'],
      orElse: () => ServiceType.Unique,
    ),
    cost: json['cost'],
    date: DateTime.parse(json['date'] as String),
  );

  Map<String, dynamic> toJson() => {
    'type': type.toString().split('.').last,
    'cost': cost,
    'date': date.toIso8601String(),
  };
}
