import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/field_type.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final FieldType type;
  final TextEditingController? controller;
  final void Function(String?)? onDropDownChanged;
  final List<String>? dropdownItems;
  final bool readOnly;

  const CustomInputField({
    super.key,
    required this.label,
    required this.icon,
    required this.type,
    this.controller,
    this.onDropDownChanged,
    this.dropdownItems,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Widget inputWidget;

    switch (type) {
      case FieldType.dropdown:
        inputWidget = DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
          hint: Text(label),
          items: (dropdownItems ?? [])
              .map(
                (String value) =>
                    DropdownMenuItem<String>(value: value, child: Text(value)),
              )
              .toList(),
          onChanged: onDropDownChanged,
        );
        break;
      case FieldType.number:
        inputWidget = TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            isDense: true,
          ),
          keyboardType: TextInputType.number,
        );
        break;
      case FieldType.text:
        inputWidget = TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            isDense: true,
          ),
          readOnly: readOnly,
        );
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: colorScheme.onSurface),
              const SizedBox(width: 15),
              Expanded(child: inputWidget),
            ],
          ),
        ],
      ),
    );
  }
}
