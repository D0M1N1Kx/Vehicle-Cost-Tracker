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
  String get garageSub => 'Managing and modifying your cars';

  @override
  String get maintenanceReminder => 'Maintenance reminder';

  @override
  String get maintenanceSub => 'Recorded statuses and due dates';

  @override
  String get noVehFound => 'No vehicles found. Please add a vehicle first.';

  @override
  String get refuelingLog => 'Refueling Log';

  @override
  String get refuelingSub => 'Tracking monthly fuel costs';

  @override
  String get serviceLog => 'Service Log';

  @override
  String get serviceSub => 'Repairs carried out and their costs';

  @override
  String get monthlyCost => 'Monthly Cost';

  @override
  String get totalCost => 'Total Cost';

  @override
  String get fuelQuantity => 'Fuel Quantity';

  @override
  String get settings => 'Settings';

  @override
  String get settingsSub => 'Languages, currency, units and other options';

  @override
  String get currency => '\$';

  @override
  String get unit => 'km';

  @override
  String get fuelUnit => 'L';

  @override
  String get addVehicle => 'Add Vehicle';

  @override
  String get brand => 'Brand';

  @override
  String get modell => 'Modell';

  @override
  String get engineType => 'Engine type';

  @override
  String get color => 'Color';

  @override
  String get year => 'Year';

  @override
  String get odometer => 'Odometer reading';

  @override
  String get licensePlate => 'License plate';

  @override
  String get chassisNumber => 'Chassis number (optional)';

  @override
  String get save => 'Save';
}
