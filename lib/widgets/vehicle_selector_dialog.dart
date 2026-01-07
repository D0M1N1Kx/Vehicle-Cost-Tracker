import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';

Future<Vehicle?> showVehicleSelector(
  BuildContext context,
  List<Vehicle> vehicles,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.selectVehicle),
        alignment: Alignment.center,
        content: Container(
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
                  leading: Icon(Icons.directions_car, color: Colors.blue),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
