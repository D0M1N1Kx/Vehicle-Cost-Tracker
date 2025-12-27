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
  String? brandController;
  final TextEditingController chasissController = TextEditingController();
  String? engineController;

  VehicleRepository vehicleManager = VehicleRepository();
  void setParameters() {
    modellController.text = widget.car.modell;
    yearController.text = widget.car.year.toString();
    odometerController.text = widget.car.km.toString();
    licenseController.text = widget.car.licensePlate;
    engineTypeController.text = widget.car.engine.toString();
    colorController.text = widget.car.color;
    brandController = widget.car.brand;
    engineController = widget.car.engine;
    chasissController.text = widget.car.chassisNumber ?? '';
  }

  @override
  void initState() {
    super.initState();
    setParameters();
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
                label: 'Engine controller',
                icon: Icons.construction,
                type: FieldType.dropdown,
                dropdownItems: ['Belt', 'Chain', 'None'],
                onDropDownChanged: (String? newValue) {
                  setState(() {
                    engineController = newValue;
                  });
                },
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
                onPressed: () async {
                  final String finalBrand = brandController ?? '';

                  await vehicleManager.load();

                  await vehicleManager.editVehicle(
                    Vehicle(
                      id: widget.car.id,
                      brand: finalBrand,
                      modell: modellController.text,
                      km: int.parse(odometerController.text),
                      color: colorController.text,
                      licensePlate: licenseController.text,
                      year: int.parse(yearController.text),
                      chassisNumber: chasissController.text,
                      engine: engineTypeController.text,
                    ),
                  );
                  if (context.mounted) Navigator.of(context).pop();
                },
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
