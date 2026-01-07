import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
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
            title: Text(AppLocalizations.of(context)!.newServiceLog),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomInputField(
                    label: AppLocalizations.of(context)!.serviceType,
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
                    label: AppLocalizations.of(context)!.cost,
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
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedServiceType == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!.serviceTypeErr,
                        ),
                      ),
                    );
                    return;
                  }
                  if (costController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)!.costErr),
                      ),
                    );
                    return;
                  }
                  final int? cost = int.tryParse(costController.text);
                  if (cost == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!.costErrValid,
                        ),
                      ),
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
                child: Text(AppLocalizations.of(context)!.addService),
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
