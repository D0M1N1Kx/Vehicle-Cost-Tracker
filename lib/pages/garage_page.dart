import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/pages/add_vehicle_page.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/widgets/empty_garage.dart';
import 'package:vehicle_cost_tracker_app/widgets/vehicle_list.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  final VehicleRepository vehicleManager = VehicleRepository();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await vehicleManager.load();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final bool isGarageEmpty = vehicleManager.isEmpty();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('GARAGE')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Vehicle? newVehicle = await Navigator.of(context).push<Vehicle>(
            MaterialPageRoute(builder: (context) => AddVehiclePage()),
          );

          if (newVehicle != null) {
            await vehicleManager.addVehicle(newVehicle);
            await _loadData();
          }
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 36),
        child: Column(
          mainAxisAlignment: isGarageEmpty
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isGarageEmpty
                ? EmptyGarage()
                : VehicleList(
                    cars: vehicleManager.getVehicles(),
                    onDelete: (int id) async {
                      await vehicleManager.deleteVehicle(id);
                      await _loadData();
                    },
                    onRefresh: () async {
                      await _loadData();
                    },
                    onEdit: (Vehicle edited) async {
                      await vehicleManager.editVehicle(edited);
                      await _loadData();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
