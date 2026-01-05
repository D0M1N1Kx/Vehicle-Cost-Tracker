import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';
import 'package:vehicle_cost_tracker_app/models/service_type.dart';
import 'package:vehicle_cost_tracker_app/widgets/custom_input_field.dart';

Future<Service?> showAddServiceDialog(BuildContext context) {
  final TextEditingController costController = TextEditingController();
  String? selectedServiceType;
  final serviceTypeList = ServiceType.values
      .map((type) => type.toString().split('.').last)
      .toList();

  return showDialog<Service>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Add New Service'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomInputField(
                    label: 'Service Type',
                    icon: Icons.build_circle_outlined,
                    type: FieldType.dropdown,
                    dropdownItems: serviceTypeList,
                    onDropDownChanged: (String? newValue) {
                      setState(() {
                        selectedServiceType = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    label: 'Cost',
                    icon: Icons.attach_money,
                    type: FieldType.number,
                    controller: costController,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedServiceType == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a service type')),
                    );
                    return;
                  }
                  if (costController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a cost')),
                    );
                    return;
                  }
                  final int? cost = int.tryParse(costController.text);
                  if (cost == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cost must be a valid number')),
                    );
                    return;
                  }

                  final serviceType = ServiceType.values.firstWhere(
                    (type) =>
                        type.toString().split('.').last == selectedServiceType,
                  );

                  final newService = Service(
                    type: serviceType,
                    cost: cost,
                    date: DateTime.now(),
                  );

                  Navigator.of(context).pop(newService);
                },
                child: Text('Add Service'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
