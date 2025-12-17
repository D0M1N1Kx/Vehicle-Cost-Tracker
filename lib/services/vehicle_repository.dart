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

  bool isEmpty() => _vehicles.isEmpty;
  Future<List<Vehicle>> getVehicles() async {
    await load();
    return _vehicles;
  }
}
