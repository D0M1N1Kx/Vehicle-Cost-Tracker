// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Fahrzeugkostenverfolgung';

  @override
  String get garage => 'Garage';

  @override
  String get garageSub => 'Verwaltung und Modifizierung von Autos';

  @override
  String get maintenanceReminder => 'Wartungserinnerung';

  @override
  String get maintenanceSub => 'Aufgezeichnete Zustände und Fristen';

  @override
  String get noVehFound =>
      'Es wurden keine Fahrzeuge gefunden. Bitte fügen Sie zuerst ein Fahrzeug hinzu.';

  @override
  String get refuelingLog => 'Tanklog';

  @override
  String get refuelingSub => 'Monatliche Kraftstoffkosten erfassen';

  @override
  String get serviceLog => 'Wartungsprotokoll';

  @override
  String get serviceSub => 'Durchgeführte Reparaturen und deren Kosten';

  @override
  String get monthlyCost => 'Monatliche Kosten';

  @override
  String get totalCost => 'Gesamtkosten';

  @override
  String get fuelQuantity => 'Kraftstoffmenge';

  @override
  String get settings => 'Einstellungen';

  @override
  String get settingsSub => 'Sprachen, Währung, Einheiten und weitere Optionen';

  @override
  String get currency => '€';

  @override
  String get unit => 'km';

  @override
  String get fuelUnit => 'L';

  @override
  String get addVehicle => 'Add Vehicle';

  @override
  String get brand => 'Brand';

  @override
  String get brandErr => 'Please select a brand';

  @override
  String get modell => 'Modell';

  @override
  String get modellErr => 'Please enter a model name';

  @override
  String get engineType => 'Engine type';

  @override
  String get engineTypeErr => 'Please enter engine type';

  @override
  String get color => 'Color';

  @override
  String get colorErr => 'Please enter color';

  @override
  String get year => 'Year';

  @override
  String get yearErr => 'Please enter a year';

  @override
  String get yearErrValid => 'Year must be a valid number';

  @override
  String get odometer => 'Odometer reading';

  @override
  String get odometerErr => 'Please enter odometer reading';

  @override
  String get odometerErrValid => 'Odometer must be a valid number';

  @override
  String get licensePlate => 'License plate';

  @override
  String get licensePlateErr => 'Please enter license plate';

  @override
  String get chassisNumber => 'Chassis number (optional)';

  @override
  String get save => 'Save';
}
