import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations_de.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/widgets/custom_input_field.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final TextEditingController modellController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController odometerController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController chasissController = TextEditingController();
  final TextEditingController engineTypeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  String? brandController;

  @override
  void dispose() {
    modellController.dispose();
    yearController.dispose();
    odometerController.dispose();
    licenseController.dispose();
    chasissController.dispose();
    engineTypeController.dispose();
    colorController.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    final brand = brandController;
    final modell = modellController.text.trim();
    final year = yearController.text.trim();
    final odometer = odometerController.text.trim();
    final license = licenseController.text.trim();
    final engine = engineTypeController.text.trim();
    final color = colorController.text.trim();

    // Check if any required field is empty
    if (brand == null || brand.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.brandErr);
      return false;
    }
    if (modell.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.modellErr);
      return false;
    }
    if (year.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.yearErr);
      return false;
    }
    if (odometer.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.odometerErr);
      return false;
    }
    if (license.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.licensePlateErr);
      return false;
    }
    if (engine.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.engineTypeErr);
      return false;
    }
    if (color.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.colorErr);
      return false;
    }

    final int? parsedYear = int.tryParse(year);
    final int? parsedOdometer = int.tryParse(odometer);

    if (parsedYear == null) {
      _showErrorSnackbar(AppLocalizations.of(context)!.yearErrValid);
      return false;
    }
    if (parsedOdometer == null) {
      _showErrorSnackbar(AppLocalizations.of(context)!.odometerErrValid);
      return false;
    }

    return true;
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _saveVehicle() {
    if (!_validateInputs()) {
      return;
    }

    final int year = int.parse(yearController.text.trim());
    final int odometer = int.parse(odometerController.text.trim());

    final vehicle = Vehicle(
      id: DateTime.now().millisecondsSinceEpoch,
      brand: brandController!,
      modell: modellController.text.trim(),
      km: odometer,
      color: colorController.text.trim(),
      licensePlate: licenseController.text.trim(),
      year: year,
      chassisNumber: chasissController.text.trim().isEmpty
          ? null
          : chasissController.text.trim(),
      engine: engineTypeController.text.trim(),
    );

    Navigator.of(context).pop(vehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.addVehicle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInputField(
                label: AppLocalizations.of(context)!.brand,
                icon: Icons.garage_sharp,
                type: FieldType.dropdown,
                dropdownItems: [
                  'Abarth',
                  'Alfa Romeo',
                  'Aston Martin',
                  'Audi',
                  'Bentley',
                  'BMW',
                  'Bugatti',
                  'Cadillac',
                  'Chevrolet',
                  'Citroen',
                  'Dodge',
                  'Ferrari',
                  'Fiat',
                  'Ford',
                  'Honda',
                  'Hummer',
                  'Hyundai',
                  'Iveco',
                  'Jaguar',
                  'Jeep',
                  'Kia',
                  'KTM',
                  'Lada',
                  'Lamborghini',
                  'Land Rover',
                  'Lexus',
                  'Lotus',
                  'Maserati',
                  'Maybach',
                  'Mazda',
                  'McLaren',
                  'Mercedes-Benz',
                  'Mitsubishi',
                  'Nissan',
                  'Opel',
                  'Peugeot',
                  'Porsche',
                  'Renault',
                  'Rolls-Royce',
                  'Rover',
                  'Saab',
                  'Skoda',
                  'Seat',
                  'Smart',
                  'Subaru',
                  'Tesla',
                  'Toyota',
                  'Volkswagen',
                  'Volvo',
                ],
                onDropDownChanged: (String? newValue) {
                  setState(() {
                    brandController = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.modell,
                icon: Icons.star,
                type: FieldType.text,
                controller: modellController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.engineType,
                icon: Icons.directions_car,
                type: FieldType.text,
                controller: engineTypeController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.color,
                icon: Icons.color_lens_rounded,
                type: FieldType.text,
                controller: colorController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.year,
                icon: Icons.calendar_month,
                type: FieldType.number,
                controller: yearController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.odometer,
                icon: Icons.speed,
                type: FieldType.number,
                controller: odometerController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.licensePlate,
                icon: Icons.rectangle,
                type: FieldType.text,
                controller: licenseController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: AppLocalizations.of(context)!.chassisNumber,
                icon: Icons.qr_code,
                type: FieldType.text,
                controller: chasissController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orange),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: _saveVehicle,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.save),
                    Text(AppLocalizations.of(context)!.save),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
