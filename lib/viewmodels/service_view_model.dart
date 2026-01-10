import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';
import 'package:vehicle_cost_tracker_app/models/refuel.dart';

class ServiceViewModel extends ChangeNotifier {
  Vehicle _vehicle;

  ServiceViewModel(this._vehicle);

  // GETTERS
  List<Service> get services => _vehicle.services ?? [];
  List<Refuel> get refuels => _vehicle.refuels ?? [];
  Vehicle get vehicle => _vehicle;

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

  List<Map<String, dynamic>> get combinedServiceAndRefuelList {
    final List<Map<String, dynamic>> combined = [];

    // Services hozzáadása
    for (var service in services) {
      combined.add({
        'type': 'service',
        'icon': Icons.build_circle_outlined,
        'color': Colors.orange,
        'serviceType': service.type,
        'date': service.date,
        'cost': service.cost,
      });
    }

    for (var refuel in refuels) {
      combined.add({
        'type': 'refuel',
        'icon': Icons.local_gas_station,
        'color': Colors.green,
        'fuelQuantity': refuel.fuelQuantity,
        'unitPrice': (refuel.fuelCost / refuel.fuelQuantity).round(),
        'date': refuel.date,
        'cost': refuel.fuelCost,
      });
    }

    combined.sort((a, b) => b['date'].compareTo(a['date']));

    return combined;
  }

  void addService(Service service) {
    final updatedServices = [...?_vehicle.services, service];

    _vehicle = Vehicle(
      id: _vehicle.id,
      brand: _vehicle.brand,
      modell: _vehicle.modell,
      km: _vehicle.km,
      color: _vehicle.color,
      licensePlate: _vehicle.licensePlate,
      year: _vehicle.year,
      engine: _vehicle.engine,
      chassisNumber: _vehicle.chassisNumber,
      refuels: _vehicle.refuels,
      services: updatedServices,
    );

    notifyListeners();
  }
}
