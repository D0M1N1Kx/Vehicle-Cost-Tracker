import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';

class EmptyGarage extends StatelessWidget {
  const EmptyGarage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.car_crash, size: 62, color: Colors.red),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.emptyGarage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.addANewVehicle,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
