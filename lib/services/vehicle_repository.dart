import 'package:vehicle_cost_tracker_app/models/vehicle.dart';

class VehicleRepository {
  final List<Vehicle> _vehicles = [];

  void addVehicle(Vehicle vehicle) {
    _vehicles.add(vehicle);
  }

  void deleteVehicle(String id) {
    _vehicles.removeWhere((item) => item.id == id);
  }

  bool isEmpty() {
    if (_vehicles.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  List<Vehicle> getVehicles() {
    return _vehicles;
  }
}
