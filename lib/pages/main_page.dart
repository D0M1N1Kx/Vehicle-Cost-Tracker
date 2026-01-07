import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations_en.dart';
import 'package:vehicle_cost_tracker_app/pages/garage_page.dart';
import 'package:vehicle_cost_tracker_app/pages/refueling_log_page.dart';
import 'package:vehicle_cost_tracker_app/pages/service_log_page.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/widgets/button_card.dart';
import 'package:vehicle_cost_tracker_app/widgets/vehicle_selector_dialog.dart';
import 'package:vehicle_cost_tracker_app/pages/settings_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
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
              title: AppLocalizations.of(context)!.garage,
              subtitle: AppLocalizations.of(context)!.garageSub,
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.notifications_active,
              iconColor: Colors.yellow,
              title: AppLocalizations.of(context)!.maintenanceReminder,
              subtitle: AppLocalizations.of(context)!.maintenanceSub,
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
                    AppLocalizations.of(context)!.noVehFound,
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
              title: AppLocalizations.of(context)!.refuelingLog,
              subtitle: AppLocalizations.of(context)!.refuelingSub,
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
                    AppLocalizations.of(context)!.noVehFound,
                  );
                  return;
                }

                if (vehicles.length == 1) {
                  if (context.mounted) {
                    final Vehicle? updatedVehicle = await Navigator.of(context)
                        .push<Vehicle>(
                          MaterialPageRoute(
                            builder: (context) =>
                                ServiceLogPage(vehicle: vehicles.first),
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
                          builder: (context) =>
                              ServiceLogPage(vehicle: selected),
                        ),
                      );

                  if (updatedVehicle != null) {
                    await repo.editVehicle(updatedVehicle);
                  }
                }
              },
              icon: Icons.edit_document,
              iconColor: Colors.indigo,
              title: AppLocalizations.of(context)!.serviceLog,
              subtitle: AppLocalizations.of(context)!.serviceSub,
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: Icons.settings,
              iconColor: Colors.grey,
              title: AppLocalizations.of(context)!.settings,
              subtitle: AppLocalizations.of(context)!.settingsSub,
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
