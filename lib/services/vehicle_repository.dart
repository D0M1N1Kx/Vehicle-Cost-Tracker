import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class VehicleRepository {
  List<Vehicle> _vehicles = [];

  Future<File> getFile() async {
    final folder = await getApplicationDocumentsDirectory();
    return File('${folder.path}/datas.json');
  }

  Future<void> save() async {
    final file = await getFile();
    String text = jsonEncode(_vehicles.map((v) => v.toJson()).toList());
    await file.writeAsString(text);
  }

  Future<void> load() async {
    final file = await getFile();
    if (await file.exists()) {
      String text = await file.readAsString();
      List datas = jsonDecode(text);
      _vehicles = datas.map((e) => Vehicle.fromJson(e)).toList();
    }
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    _vehicles.add(vehicle);
    await save();
  }

  Future<void> editVehicle(Vehicle vehicle) async {
    final int index = _vehicles.indexWhere((v) => v.id == vehicle.id);
    if (index != -1) {
      _vehicles[index] = vehicle;
      await save();
    }
  }

  Future<void> deleteVehicle(int id) async {
    int indexToRemove = _vehicles.indexWhere((v) => v.id == id);
    if (indexToRemove != -1) {
      _vehicles.removeAt(indexToRemove);
      await save();
    }
  }

  bool isEmpty() => _vehicles.isEmpty;
  List<Vehicle> getVehicles() {
    return _vehicles;
  }
}
