import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
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
  String? brandController = null;
  String? engineController = null;

  VehicleRepository vehicleManager = VehicleRepository();

  @override
  void dispose() {
    modellController.dispose();
    yearController.dispose();
    odometerController.dispose();
    licenseController.dispose();
    chasissController.dispose();
    engineTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ADD VEHICLE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            SizedBox(height: 60),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                final String finalBrand = brandController ?? '';
                final String finalEngineController = engineController ?? '';

                final String newId = DateTime.now().millisecondsSinceEpoch
                    .toString();

                vehicleManager.addVehicle(
                  Vehicle(
                    id: int.parse(newId),
                    brand: finalBrand,
                    modell: modellController.text,
                    km: int.parse(odometerController.text),
                    color: 'None',
                    licensePlate: licenseController.text,
                    year: int.parse(yearController.text),
                    chassisNumber: chasissController.text,
                    engine: finalEngineController,
                  ),
                );

                Navigator.of(context).pop();
              },
              child: Row(
                children: [Icon(Icons.save), Text('Save')],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
