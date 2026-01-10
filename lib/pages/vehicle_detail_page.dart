import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/pages/edit_vehicle_page.dart';
import 'package:vehicle_cost_tracker_app/pages/refueling_log_page.dart';
import 'package:vehicle_cost_tracker_app/pages/service_log_page.dart';
import 'package:vehicle_cost_tracker_app/widgets/button_card.dart';

class VehicleDetailPage extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailPage({required this.vehicle, super.key});

  String _getBrandLogoAsset(String brand) {
    final logoMap = {
      'audi': 'assets/images/brands/audi_logo.png',
      'ford': 'assets/images/brands/ford_logo.png',
      'bmw': 'assets/images/brands/bmw_logo.png',
      'mercedes-benz': 'assets/images/brands/mercedes_logo.png',
      'volkswagen': 'assets/images/brands/volkswagen_logo.png',
      'skoda': 'assets/images/brands/skoda_logo.png',
      'opel': 'assets/images/brands/opel_logo.png',
      'renault': 'assets/images/brands/renault_logo.png',
      'peugeot': 'assets/images/brands/peugeot_logo.png',
      'citroen': 'assets/images/brands/citroen_logo.png',
    };

    return logoMap[brand.toLowerCase()] ??
        'assets/images/brands/default_logo.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${vehicle.brand} ${vehicle.modell}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: () async {
              final Vehicle? editedVehicle = await Navigator.push<Vehicle>(
                context,
                MaterialPageRoute(
                  builder: (context) => EditVehiclePage(car: vehicle),
                ),
              );
              if (editedVehicle != null && context.mounted) {
                Navigator.pop(context, editedVehicle);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    border: BoxBorder.all(color: Colors.grey, width: 1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                _getBrandLogoAsset(vehicle.brand),
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Icon(
                                  Icons.directions_car,
                                  size: 40,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.vehDetails,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    vehicle.brand,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    vehicle.modell,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Details Grid
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            // Row 1: License Plate & Year
                            Row(
                              children: [
                                Expanded(
                                  child: _DetailItem(
                                    label: AppLocalizations.of(
                                      context,
                                    )!.licensePlate.toUpperCase(),
                                    value: vehicle.licensePlate,
                                    icon: Icons.confirmation_num,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _DetailItem(
                                    label: AppLocalizations.of(
                                      context,
                                    )!.year.toUpperCase(),
                                    value: vehicle.year.toString(),
                                    icon: Icons.calendar_today,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Row 2: Km & Color
                            Row(
                              children: [
                                Expanded(
                                  child: _DetailItem(
                                    label: AppLocalizations.of(
                                      context,
                                    )!.kilometers.toUpperCase(),
                                    value: '${vehicle.km} km',
                                    icon: Icons.speed,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _DetailItem(
                                    label: AppLocalizations.of(
                                      context,
                                    )!.color.toUpperCase(),
                                    value: vehicle.color,
                                    icon: Icons.palette,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Row 3: Engine (Full Width)
                            _DetailItem(
                              label: AppLocalizations.of(
                                context,
                              )!.engineType.toUpperCase(),
                              value: vehicle.engine ?? 'N/A',
                              icon: Icons.settings,
                              fullWidth: true,
                            ),
                            const SizedBox(height: 12),
                            // Row 4: Chassis (Full Width)
                            if (vehicle.chassisNumber != null)
                              _DetailItem(
                                label: AppLocalizations.of(
                                  context,
                                )!.chassisNumber.toUpperCase(),
                                value: vehicle.chassisNumber!,
                                icon: Icons.security,
                                fullWidth: true,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Quick Action Cards
              ButtonCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RefuelingLogPage(car: vehicle),
                    ),
                  );
                },
                icon: Icons.local_gas_station_rounded,
                iconColor: Colors.green,
                title: AppLocalizations.of(context)!.refuelingLog,
                subtitle: AppLocalizations.of(context)!.refuelingSub,
              ),
              const SizedBox(height: 12),
              ButtonCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceLogPage(vehicle: vehicle),
                    ),
                  );
                },
                icon: Icons.edit_document,
                iconColor: Colors.blue,
                title: AppLocalizations.of(context)!.serviceLog,
                subtitle: AppLocalizations.of(context)!.serviceSub,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool fullWidth;

  const _DetailItem({
    required this.label,
    required this.value,
    required this.icon,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
