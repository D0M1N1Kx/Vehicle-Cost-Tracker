// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Vehicle Cost Tracker';

  @override
  String get garage => 'Garage';

  @override
  String get refuelingLog => 'Refueling Log';

  @override
  String get serviceLog => 'Service Log';

  @override
  String get monthlyCost => 'Monthly Cost';

  @override
  String get totalCost => 'Total Cost';

  @override
  String get fuelQuantity => 'Fuel Quantity';

  @override
  String get currency => '\$';

  @override
  String get unit => 'km';

  @override
  String get fuelUnit => 'L';
}
