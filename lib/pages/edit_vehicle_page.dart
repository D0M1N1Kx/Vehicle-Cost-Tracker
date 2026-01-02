import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/widgets/custom_input_field.dart';

class EditVehiclePage extends StatefulWidget {
  final Vehicle car;
  const EditVehiclePage({super.key, required this.car});

  @override
  State<EditVehiclePage> createState() => _EditVehiclePageState();
}

class _EditVehiclePageState extends State<EditVehiclePage> {
  final TextEditingController modellController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController odometerController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController engineTypeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController chasissController = TextEditingController();
  String? brandController;

  @override
  void initState() {
    super.initState();
    _setParameters();
  }

  void _setParameters() {
    modellController.text = widget.car.modell;
    yearController.text = widget.car.year.toString();
    odometerController.text = widget.car.km.toString();
    licenseController.text = widget.car.licensePlate;
    engineTypeController.text = widget.car.engine ?? '';
    colorController.text = widget.car.color;
    brandController = widget.car.brand;
    chasissController.text = widget.car.chassisNumber ?? '';
  }

  @override
  void dispose() {
    modellController.dispose();
    yearController.dispose();
    odometerController.dispose();
    licenseController.dispose();
    engineTypeController.dispose();
    colorController.dispose();
    chasissController.dispose();
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

    if (brand == null || brand.isEmpty) {
      _showErrorSnackbar('Please select a brand');
      return false;
    }
    if (modell.isEmpty) {
      _showErrorSnackbar('Please enter a model name');
      return false;
    }
    if (year.isEmpty) {
      _showErrorSnackbar('Please enter a year');
      return false;
    }
    if (odometer.isEmpty) {
      _showErrorSnackbar('Please enter odometer reading');
      return false;
    }
    if (license.isEmpty) {
      _showErrorSnackbar('Please enter license plate');
      return false;
    }
    if (engine.isEmpty) {
      _showErrorSnackbar('Please enter engine type');
      return false;
    }
    if (color.isEmpty) {
      _showErrorSnackbar('Please enter color');
      return false;
    }

    final int? parsedYear = int.tryParse(year);
    final int? parsedOdometer = int.tryParse(odometer);

    if (parsedYear == null) {
      _showErrorSnackbar('Year must be a valid number');
      return false;
    }
    if (parsedOdometer == null) {
      _showErrorSnackbar('Odometer must be a valid number');
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
      id: widget.car.id,
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
      refuels: widget.car.refuels,
      services: widget.car.services,
    );

    Navigator.of(context).pop(vehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'EDIT VEHICLE',
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
                label: 'Brand',
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
                label: 'Modell',
                icon: Icons.star,
                type: FieldType.text,
                controller: modellController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Engine type',
                icon: Icons.directions_car,
                type: FieldType.text,
                controller: engineTypeController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Color',
                icon: Icons.color_lens_rounded,
                type: FieldType.text,
                controller: colorController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Year',
                icon: Icons.calendar_month,
                type: FieldType.number,
                controller: yearController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Odometer reading',
                icon: Icons.speed,
                type: FieldType.number,
                controller: odometerController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'License plate',
                icon: Icons.rectangle,
                type: FieldType.text,
                controller: licenseController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Chassis number (optional)',
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
                  children: [Icon(Icons.save), Text('Save')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
