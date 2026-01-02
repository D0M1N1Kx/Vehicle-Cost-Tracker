import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/config.dart';
import 'package:vehicle_cost_tracker_app/pages/garage_page.dart';
import 'package:vehicle_cost_tracker_app/pages/refueling_log_page.dart';
import 'package:vehicle_cost_tracker_app/pages/service_log_page.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/widgets/button_card.dart';

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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'No vehicles found. Please add a vehicle first.',
                      ),
                    ),
                  );
                  return;
                }

                if (vehicles.length == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          RefuelingLogPage(car: vehicles.first),
                    ),
                  );
                  return;
                }

                final Vehicle? selected = await showDialog<Vehicle>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Select Vehicle'),
                      alignment: Alignment.center,
                      content: SizedBox(
                        width: double.maxFinite,
                        height: 300,
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: vehicles.length,
                            itemBuilder: (context, index) {
                              final v = vehicles[index];
                              return ListTile(
                                title: Text('${v.brand} ${v.modell}'),
                                onTap: () => Navigator.of(context).pop(v),
                                leading: Icon(
                                  Icons.directions_car,
                                  color: Colors.blue,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );

                if (selected != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RefuelingLogPage(car: selected),
                    ),
                  );
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'No vehicles found. Please add a vehicle first.',
                      ),
                    ),
                  );
                  return;
                }

                if (vehicles.length == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ServiceLogPage(vehicle: vehicles.first),
                    ),
                  );
                  return;
                }

                final Vehicle? selected = await showDialog<Vehicle>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Select Vehicle'),
                      alignment: Alignment.center,
                      content: SizedBox(
                        width: double.maxFinite,
                        height: 300,
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: vehicles.length,
                            itemBuilder: (context, index) {
                              final v = vehicles[index];
                              return ListTile(
                                title: Text('${v.brand} ${v.modell}'),
                                onTap: () => Navigator.of(context).pop(v),
                                leading: Icon(
                                  Icons.directions_car,
                                  color: Colors.blue,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );

                if (selected != null) {
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
}
