import 'package:vehicle_cost_tracker_app/models/service_type.dart';

class Service {
  final ServiceType type;
  final int cost;
  final DateTime date;

  Service({required this.type, required this.cost, required this.date});
}
