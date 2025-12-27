import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/pages/edit_vehicle_page.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';

class VehicleList extends StatefulWidget {
  final List<Vehicle> cars;
  final VehicleRepository repository;

  const VehicleList({super.key, required this.cars, required this.repository});

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  late List<Vehicle> _cars;

  @override
  void initState() {
    super.initState();
    _cars = widget.cars;
  }

  @override
  void didUpdateWidget(covariant VehicleList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Keep local copy in sync when parent provides a new list
    _cars = widget.cars;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _cars.length,
        itemBuilder: (context, index) {
          final car = _cars[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () async {
                // Await navigation, then reload from repository to pick up edits
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditVehiclePage(car: car),
                  ),
                );
                await widget.repository.load();
                setState(() {
                  _cars = widget.repository.getVehicles();
                });
              },
              child: ListTile(
                leading: Icon(Icons.directions_car, color: Colors.blue),
                title: Text('${car.brand} ${car.modell} ${car.engine}'),
                subtitle: Row(
                  children: [
                    Icon(Icons.rectangle_outlined, size: 16),
                    Text(" ${car.licensePlate}  "),
                    Icon(Icons.speed, size: 16),
                    Text(" ${car.km}  "),
                    Icon(Icons.date_range_sharp, size: 16),
                    Text(" ${car.year}  "),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {
                    final carID = car.id;
                    await widget.repository.deleteVehicle(carID);
                    await widget.repository.load();
                    setState(() {
                      _cars = widget.repository.getVehicles();
                    });
                  },
                  icon: Icon(Icons.delete_forever_rounded, color: Colors.red),
                ),
                contentPadding: EdgeInsets.only(left: 16, right: 6),
              ),
            ),
          );
        },
      ),
    );
  }
}
