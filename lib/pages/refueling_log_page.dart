import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/refuel.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/refueling_view_model.dart';
import 'package:vehicle_cost_tracker_app/widgets/custom_input_field.dart';
import 'package:vehicle_cost_tracker_app/widgets/month_selector.dart';

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

  late Vehicle _currentVehicle;
  late RefuelingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _currentVehicle = widget.car;
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

    final updatedRefuels = [...?_currentVehicle.refuels, refuel];

    _currentVehicle = Vehicle(
      id: _currentVehicle.id,
      brand: _currentVehicle.brand,
      modell: _currentVehicle.modell,
      km: _currentVehicle.km,
      color: _currentVehicle.color,
      licensePlate: _currentVehicle.licensePlate,
      year: _currentVehicle.year,
      engine: _currentVehicle.engine,
      chassisNumber: _currentVehicle.chassisNumber,
      refuels: updatedRefuels,
      services: _currentVehicle.services,
    );

    // Töröld a controller-eket
    quantityController.clear();
    priceController.clear();
    costController.clear();

    // Frissítsd a ViewModel-et
    _viewModel.updateVehicle(_currentVehicle);

    // Siker snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Refuel saved!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _onBackPressed() {
    Navigator.of(context).pop(_currentVehicle);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RefuelingViewModel(vehicle: widget.car),
      builder: (context, child) {
        // Tárold el a ViewModel referenciáját
        _viewModel = context.watch<RefuelingViewModel>();

        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop(_currentVehicle);
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Refueling - ${widget.car.brand} ${widget.car.modell}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // MONTH SELECTOR
                  MonthSelector(),

                  // STATISTICS CARDS
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Consumer<RefuelingViewModel>(
                      builder: (context, viewModel, _) {
                        return Column(
                          children: [
                            // Stats Row - 2x2 Grid
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: _StatCard(
                                        label: 'Monthly Cost',
                                        value: viewModel.monthlyTotalCost
                                            .toString(),
                                        icon: Icons.calendar_month,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: _StatCard(
                                        label: 'Total Cost',
                                        value: viewModel.totalCostAllTime
                                            .toString(),
                                        icon: Icons.wallet,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: _StatCard(
                                        label: 'Avg Per Fill',
                                        value: viewModel.monthlyAverage
                                            .toString(),
                                        icon: Icons.trending_up,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: _StatCard(
                                        label: 'Monthly Liters',
                                        value: viewModel.monthlyTotalLiters
                                            .toString(),
                                        icon: Icons.water_drop_outlined,
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // ADD NEW REFUEL CARD
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
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                              Colors.green,
                                            ),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                              Colors.black,
                                            ),
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

                            SizedBox(height: 20),

                            // REFUELS LIST
                            Consumer<RefuelingViewModel>(
                              builder: (context, viewModel, _) {
                                final refuels =
                                    viewModel.refuelsForSelectedMonth;

                                if (refuels.isEmpty) {
                                  return Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      'No refuels in this month',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                }

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Refuels this month',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: refuels.length,
                                      itemBuilder: (context, index) {
                                        final refuel = refuels[index];
                                        return Card(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.local_gas_station,
                                              color: Colors.green,
                                            ),
                                            title: Text(
                                              '${refuel.fuelQuantity}L x ${(refuel.fuelCost / refuel.fuelQuantity).toStringAsFixed(2)} = ${refuel.fuelCost}',
                                            ),
                                            subtitle: Text(
                                              refuel.date.toString().split(
                                                ' ',
                                              )[0],
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// HELPER WIDGET - STAT CARD
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
