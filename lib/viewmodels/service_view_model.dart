import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';
import 'package:vehicle_cost_tracker_app/models/refuel.dart';

class ServiceViewModel extends ChangeNotifier {
  final Vehicle _vehicle;

  ServiceViewModel(this._vehicle);

  // GETTERS
  List<Service> get services => _vehicle.services ?? [];
  List<Refuel> get refuels => _vehicle.refuels ?? [];

  int get allServicesAndRefuelsCount {
    return (_vehicle.services?.length ?? 0) + (_vehicle.refuels?.length ?? 0);
  }

  int get totalCosts {
    final serviceCosts = services.fold<double>(
      0,
      (sum, item) => sum + item.cost,
    );
    final refuelCosts = refuels.fold<double>(
      0,
      (sum, item) => sum + item.fuelCost,
    );
    return (serviceCosts + refuelCosts).round();
  }
}
