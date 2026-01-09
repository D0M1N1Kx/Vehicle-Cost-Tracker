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
  String get garageSub => 'Verwaltung und Modifizierung von Fahrzeugen';

  @override
  String get maintenanceReminder => 'Wartungserinnerung';

  @override
  String get maintenanceSub => 'Aufgezeichnete Zustände und Fristen';

  @override
  String get noVehFound =>
      'Keine Fahrzeuge gefunden. Bitte fügen Sie zuerst ein Fahrzeug hinzu.';

  @override
  String get refuelingLog => 'Tankprotokoll';

  @override
  String get refuelingSub => 'Monatliche Kraftstoffkosten verfolgen';

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
  String get addVehicle => 'Fahrzeug hinzufügen';

  @override
  String get brand => 'Marke';

  @override
  String get brandErr => 'Bitte wählen Sie eine Marke';

  @override
  String get modell => 'Modell';

  @override
  String get modellErr => 'Bitte geben Sie einen Modellnamen ein';

  @override
  String get engineType => 'Motortyp';

  @override
  String get engineTypeErr => 'Bitte geben Sie den Motortyp ein';

  @override
  String get color => 'Farbe';

  @override
  String get colorErr => 'Bitte geben Sie eine Farbe ein';

  @override
  String get year => 'Jahrgang';

  @override
  String get yearErr => 'Bitte geben Sie das Jahr ein';

  @override
  String get yearErrValid => 'Das Jahr muss eine gültige Zahl sein';

  @override
  String get odometer => 'Kilometerzähler';

  @override
  String get odometerErr => 'Bitte geben Sie den Kilometerzähler ein';

  @override
  String get odometerErrValid =>
      'Der Kilometerzähler muss eine gültige Zahl sein';

  @override
  String get licensePlate => 'Kennzeichen';

  @override
  String get licensePlateErr => 'Bitte geben Sie das Kennzeichen ein';

  @override
  String get chassisNumber => 'Fahrgestellnummer (optional)';

  @override
  String get save => 'Speichern';

  @override
  String get fuelQuantityErr => 'Bitte geben Sie die Kraftstoffmenge ein';

  @override
  String get fuelPriceErr => 'Bitte geben Sie den Kraftstoffpreis ein';

  @override
  String get fuelQuantityErrValid => 'Die Menge muss eine gültige Zahl sein';

  @override
  String get fuelPriceErrValid => 'Der Preis muss eine gültige Zahl sein';

  @override
  String get fuelQuantityErrGreater => 'Die Menge muss größer als 0 sein';

  @override
  String get fuelPriceErrGreater => 'Der Preis muss größer als 0 sein';

  @override
  String get refuelSaved => 'Betankung gespeichert!';

  @override
  String get refueling => 'Betankung';

  @override
  String get avgPerFill => 'Durchschnitt pro Tankstelle';

  @override
  String get monthlyLiters => 'Monatliche Liter';

  @override
  String get newRefuelLog => 'Neues Tankprotokoll';

  @override
  String get fuelPrice => 'Kraftstoffpreis (Währung / Liter)';

  @override
  String get fuelCost => 'Kraftstoffkosten';

  @override
  String get noRefuelsInThisMonth => 'Keine Tankungen in diesem Monat';

  @override
  String get refuelsThisMonth => 'Tankungen in diesem Monat';

  @override
  String get allServices => 'Alle Wartungen';

  @override
  String get allCosts => 'Alle Kosten';

  @override
  String get newServiceLog => 'Neue Wartung';

  @override
  String get noServicesOrRefuels => 'Keine Wartungen oder Tankungen erfasst';

  @override
  String get serviceType => 'Wartungstyp';

  @override
  String get serviceTypeErr => 'Bitte wählen Sie einen Wartungstyp';

  @override
  String get cost => 'Kosten';

  @override
  String get costErr => 'Bitte geben Sie die Kosten ein';

  @override
  String get costErrValid => 'Die Kosten müssen eine ganze Zahl sein';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get addService => 'Wartung hinzufügen';

  @override
  String get emptyGarage => 'Deine Garage ist noch leer';

  @override
  String get addANewVehicle =>
      'Füge deiner Garage ein neues Auto hinzu, um mit der Führung eines Protokolls zu beginnen!';

  @override
  String get selectVehicle => 'Fahrzeug auswählen';

  @override
  String get language => 'Sprache';

  @override
  String get currencyLabel => 'Währung';

  @override
  String get distanceUnit => 'Entfernungseinheit';

  @override
  String get kilometers => 'Kilometer';

  @override
  String get miles => 'Meilen';

  @override
  String get fuelUnitLabel => 'Kraftstoffeinheit';

  @override
  String get liters => 'Liter';

  @override
  String get gallons => 'Gallonen';

  @override
  String get quickPresets => 'Schnelleinstellungen';

  @override
  String get noServices => 'No services have been recorded yet';

  @override
  String get maintenanceSchedule => 'Maintenance Schedule';

  @override
  String get overdue => 'Overdue';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get ok => 'OK';

  @override
  String get last => 'Last';

  @override
  String get remaining => 'remaining';

  @override
  String get nextAt => 'Next at';

  @override
  String get daysRemaining => 'days remaining';

  @override
  String get every => 'Every';
}
