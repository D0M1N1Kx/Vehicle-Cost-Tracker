import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';
import 'package:vehicle_cost_tracker_app/models/service_type.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/settings_view_model.dart';
import 'package:vehicle_cost_tracker_app/widgets/custom_input_field.dart';

Future<Service?> showAddServiceDialog(
  BuildContext context, {
  int? currentKm,
}) async {
  return showDialog<Service>(
    context: context,
    builder: (context) => _AddServiceDialog(currentKm: currentKm),
  );
}

class _AddServiceDialog extends StatefulWidget {
  final int? currentKm;

  const _AddServiceDialog({this.currentKm});

  @override
  State<_AddServiceDialog> createState() => _AddServiceDialogState();
}

class _AddServiceDialogState extends State<_AddServiceDialog> {
  final TextEditingController costController = TextEditingController();
  final TextEditingController kmController = TextEditingController();
  ServiceType? selectedServiceType;

  @override
  void initState() {
    super.initState();
    if (widget.currentKm != null) {
      kmController.text = widget.currentKm.toString();
    }
  }

  @override
  void dispose() {
    costController.dispose();
    kmController.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    if (selectedServiceType == null) {
      _showErrorSnackbar(AppLocalizations.of(context)!.serviceTypeErr);
      return false;
    }

    final costText = costController.text.trim();
    if (costText.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.costErr);
      return false;
    }

    final int? cost = int.tryParse(costText);
    if (cost == null) {
      _showErrorSnackbar(AppLocalizations.of(context)!.costErrValid);
      return false;
    }

    final kmText = kmController.text.trim();
    if (kmText.isEmpty) {
      _showErrorSnackbar(AppLocalizations.of(context)!.kmErr);
      return false;
    }

    final int? km = int.tryParse(kmText);
    if (km == null) {
      _showErrorSnackbar(AppLocalizations.of(context)!.kmErrValid);
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.addService),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Service Type Dropdown
            DropdownButton<ServiceType>(
              value: selectedServiceType,
              hint: Text(AppLocalizations.of(context)!.serviceType),
              isExpanded: true,
              items: ServiceType.values
                  .where((type) => type != ServiceType.Unique)
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(
                        type.toLocalizedString(AppLocalizations.of(context)!),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedServiceType = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Cost Input
            CustomInputField(
              label: AppLocalizations.of(context)!.cost,
              icon: Icons.attach_money,
              type: FieldType.number,
              controller: costController,
            ),
            SizedBox(height: 16),

            CustomInputField(
              label:
                  '${AppLocalizations.of(context)!.current} ${context.read<SettingsViewModel>().distanceUnit}',
              icon: Icons.speed,
              type: FieldType.number,
              controller: kmController,
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
            if (!_validateInputs()) return;

            final int cost = int.parse(costController.text.trim());
            final int km = int.parse(kmController.text.trim());

            final service = Service(
              type: selectedServiceType!,
              cost: cost,
              date: DateTime.now(),
              kmAtService: km,
            );

            Navigator.of(context).pop(service);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text(
            AppLocalizations.of(context)!.save,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
