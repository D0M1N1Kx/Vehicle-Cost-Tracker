import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/widgets/empty_garage.dart';
import 'package:vehicle_cost_tracker_app/widgets/vehicle_list.dart';

class GaragePage extends StatelessWidget {
  GaragePage({super.key});

  final VehicleRepository vehicleManager = VehicleRepository();

  @override
  Widget build(BuildContext context) {
    final bool isGarageEmpty = vehicleManager.isEmpty();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('GARAGE')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
          children: [isGarageEmpty ? EmptyGarage() : VehicleList()],
        ),
      ),
    );
  }
}
