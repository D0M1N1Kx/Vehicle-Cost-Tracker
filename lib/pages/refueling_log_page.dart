import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/refuel.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/widgets/custom_input_field.dart';

class RefuelingLogPage extends StatefulWidget {
  final Vehicle car;
  const RefuelingLogPage({super.key, required this.car});

  @override
  State<RefuelingLogPage> createState() => _RefuelingLogPageState();
}

class _RefuelingLogPageState extends State<RefuelingLogPage> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantityController.addListener(_recalculateCost);
    priceController.addListener(_recalculateCost);
  }

  void _recalculateCost() {
    final String qText = quantityController.text.replaceAll(',', '.').trim();
    final String pText = priceController.text.replaceAll(',', '.').trim();

    final double? q = double.tryParse(qText);
    final double? p = double.tryParse(pText);

    if (q == null || p == null) {
      costController.value = costController.value.copyWith(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
      return;
    }

    final double cost = q * p;
    final String newCost = cost.toStringAsFixed(2);
    costController.value = costController.value.copyWith(
      text: newCost,
      selection: TextSelection.collapsed(offset: newCost.length),
    );
  }

  @override
  void dispose() {
    quantityController.removeListener(_recalculateCost);
    priceController.removeListener(_recalculateCost);
    quantityController.dispose();
    priceController.dispose();
    costController.dispose();
    super.dispose();
  }

  // ERROR HANDLING
  bool _validateInputs() {
    final qText = quantityController.text.replaceAll(',', '.').trim();
    final pText = priceController.text.replaceAll(',', '.').trim();

    if (qText.isEmpty) {
      _showErrorSnackbar('Please enter fuel quantity');
      return false;
    }
    if (pText.isEmpty) {
      _showErrorSnackbar('Please enter fuel price');
      return false;
    }

    final double? q = double.tryParse(qText);
    final double? p = double.tryParse(pText);

    if (q == null) {
      _showErrorSnackbar('Quantity must be a valid number');
      return false;
    }
    if (p == null) {
      _showErrorSnackbar('Price must be a valid number');
      return false;
    }
    if (q <= 0) {
      _showErrorSnackbar('Quantity must be greater than 0');
      return false;
    }
    if (p <= 0) {
      _showErrorSnackbar('Price must be greater than 0');
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

  void _saveRefuel() {
    if (!_validateInputs()) {
      return;
    }

    final double quantity = double.parse(
      quantityController.text.replaceAll(',', '.').trim(),
    );
    final double price = double.parse(
      priceController.text.replaceAll(',', '.').trim(),
    );
    final double cost = quantity * price;

    final refuel = Refuel(
      fuelQuantity: quantity.toInt(),
      fuelCost: cost.toInt(),
      date: DateTime.now(),
    );

    // Create new list with the new refuel
    final updatedRefuels = [...?widget.car.refuels, refuel];

    // Create new vehicle with updated refuels list
    final updatedVehicle = Vehicle(
      id: widget.car.id,
      brand: widget.car.brand,
      modell: widget.car.modell,
      km: widget.car.km,
      color: widget.car.color,
      licensePlate: widget.car.licensePlate,
      year: widget.car.year,
      engine: widget.car.engine,
      chassisNumber: widget.car.chassisNumber,
      refuels: updatedRefuels,
      services: widget.car.services,
    );

    Navigator.of(context).pop(updatedVehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Refueling - ${widget.car.brand} ${widget.car.modell}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(width: 1, color: Colors.green),
              ),
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'New refuel log',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: 'Fuel quantity (liter)',
                      icon: Icons.water_drop_outlined,
                      type: FieldType.number,
                      controller: quantityController,
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: 'Fuel price (currency / liter)',
                      icon: Icons.price_change,
                      type: FieldType.number,
                      controller: priceController,
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: 'Fuel cost',
                      icon: Icons.attach_money,
                      type: FieldType.text,
                      controller: costController,
                      readOnly: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveRefuel,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green),
                        foregroundColor: WidgetStateProperty.all(Colors.black),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.save),
                          SizedBox(width: 8),
                          Text('Save refuel'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
