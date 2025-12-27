import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';

class VehicleList extends StatefulWidget {
  final List<Vehicle> cars;
  final VehicleRepository repository;

  const VehicleList({super.key, required this.cars, required this.repository});

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.cars.length,
        itemBuilder: (context, index) {
          final car = widget.cars[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () {},
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
                    setState(() {});
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
