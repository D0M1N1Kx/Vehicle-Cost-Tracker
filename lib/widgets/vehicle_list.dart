import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> cars;

  const VehicleList({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.directions_car, color: Colors.blue),
                title: Text('${car.brand} ${car.modell}'),
                subtitle: Text(car.licensePlate),
              ),
            ),
          );
        },
      ),
    );
  }
}
