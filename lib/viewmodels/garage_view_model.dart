import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';

class GarageViewModel extends ChangeNotifier {
  final VehicleRepository _repository = VehicleRepository();

  List<Vehicle> _vehicles = [];
  bool _isLoading = true;

  // GETTERS (UI only reads from these)
  List<Vehicle> get vehicles => _vehicles;
  bool get isLoading => _isLoading;
  bool get isEmpty => _vehicles.isEmpty;

  // METHODS (UI calls these when it wants to change state)

  Future<void> loadVehicles() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.load();
      _vehicles = _repository.getVehicles();
    } catch (e) {
      print('Error loading vehicles: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      await _repository.addVehicle(vehicle);
      _vehicles.add(vehicle);
      notifyListeners();
    } catch (e) {
      print('Error adding vehicle: $e');
    }
  }

  Future<void> editVehicle(Vehicle vehicle) async {
    try {
      await _repository.editVehicle(vehicle);
      // Update in local list
      final index = _vehicles.indexWhere((v) => v.id == vehicle.id);
      if (index != -1) {
        _vehicles[index] = vehicle;
      }
      notifyListeners();
    } catch (e) {
      print('Error editing vehicle: $e');
    }
  }

  Future<void> deleteVehicle(int id) async {
    try {
      await _repository.deleteVehicle(id);
      _vehicles.removeWhere((v) => v.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting vehicle: $e');
    }
  }
}
