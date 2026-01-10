import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/pages/edit_vehicle_page.dart';
import 'package:vehicle_cost_tracker_app/pages/vehicle_detail_page.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> cars;
  final Function(int) onDelete;
  final Function(Vehicle) onEdit;

  const VehicleList({
    super.key,
    required this.cars,
    required this.onDelete,
    required this.onEdit,
  });

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
              onTap: () async {
                final Vehicle? editedVehicle = await Navigator.push<Vehicle>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehicleDetailPage(vehicle: car),
                  ),
                );

                if (editedVehicle != null) {
                  onEdit(editedVehicle);
                }
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
                  onPressed: () {
                    onDelete(car.id);
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
