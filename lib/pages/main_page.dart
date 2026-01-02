import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/config.dart';
import 'package:vehicle_cost_tracker_app/pages/garage_page.dart';
import 'package:vehicle_cost_tracker_app/pages/refueling_log_page.dart';
import 'package:vehicle_cost_tracker_app/pages/service_log_page.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/widgets/button_card.dart';
import 'package:vehicle_cost_tracker_app/widgets/vehicle_selector_dialog.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonCard(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => GaragePage()));
              },
              icon: Icons.garage,
              iconColor: Colors.blue,
              title: 'Garage',
              subtitle: 'Managing and modifying your cars',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.notifications_active,
              iconColor: Colors.yellow,
              title: 'Maintenance reminder',
              subtitle: 'Recorded statuses and due dates',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () async {
                final repo = VehicleRepository();
                await repo.load();
                final List<Vehicle> vehicles = repo.getVehicles();

                if (vehicles.isEmpty) {
                  _showErrorSnackbar(
                    context,
                    'No vehicles found. Please add a vehicle first.',
                  );
                  return;
                }

                if (vehicles.length == 1) {
                  if (context.mounted) {
                    final Vehicle? updatedVehicle = await Navigator.of(context)
                        .push<Vehicle>(
                          MaterialPageRoute(
                            builder: (context) =>
                                RefuelingLogPage(car: vehicles.first),
                          ),
                        );
                    if (updatedVehicle != null) {
                      await repo.editVehicle(updatedVehicle);
                    }
                  }
                  return;
                }

                final Vehicle? selected = await showVehicleSelector(
                  context,
                  vehicles,
                );

                if (selected != null && context.mounted) {
                  final Vehicle? updatedVehicle = await Navigator.of(context)
                      .push<Vehicle>(
                        MaterialPageRoute(
                          builder: (context) => RefuelingLogPage(car: selected),
                        ),
                      );
                  if (updatedVehicle != null) {
                    await repo.editVehicle(updatedVehicle);
                  }
                }
              },
              icon: Icons.local_gas_station_sharp,
              iconColor: Colors.green,
              title: 'Refueling log',
              subtitle: 'Tracking monthly fuel costs',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () async {
                final repo = VehicleRepository();
                await repo.load();
                List<Vehicle> vehicles = repo.getVehicles();

                if (vehicles.isEmpty) {
                  _showErrorSnackbar(
                    context,
                    'No vehicles found. Please add a vehicle first.',
                  );
                  return;
                }

                if (vehicles.length == 1) {
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ServiceLogPage(vehicle: vehicles.first),
                      ),
                    );
                  }
                  return;
                }

                final Vehicle? selected = await showVehicleSelector(
                  context,
                  vehicles,
                );

                if (selected != null && context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceLogPage(vehicle: selected),
                    ),
                  );
                }
              },
              icon: Icons.edit_document,
              iconColor: Colors.indigo,
              title: 'Service log',
              subtitle: 'Repairs carried out and their costs',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.settings,
              iconColor: Colors.grey,
              title: 'Settings',
              subtitle: 'Import, export and other options',
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
