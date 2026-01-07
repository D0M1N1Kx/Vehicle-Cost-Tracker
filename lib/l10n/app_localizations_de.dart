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
}
