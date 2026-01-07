// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Járműköltség Követő';

  @override
  String get garage => 'Garázs';

  @override
  String get garageSub => 'Autók kezelése és változtatása';

  @override
  String get maintenanceReminder => 'Karbantartás emlékeztető';

  @override
  String get maintenanceSub => 'Rögzített állapotok és határidők';

  @override
  String get noVehFound =>
      'Nem található jármű. Kérjük, először adjon hozzá egy járművet.';

  @override
  String get refuelingLog => 'Tankolás Napló';

  @override
  String get refuelingSub => 'Havi üzemanyagköltségek nyomon követése';

  @override
  String get serviceLog => 'Szervíz Napló';

  @override
  String get serviceSub => 'Az elvégzett javítások és azok költségei';

  @override
  String get monthlyCost => 'Havi Költség';

  @override
  String get totalCost => 'Összes Költség';

  @override
  String get fuelQuantity => 'Üzemanyag Mennyiség';

  @override
  String get settings => 'Beállítások';

  @override
  String get settingsSub =>
      'Nyelvek, pénznem, mértékegységek és egyéb beállítások';

  @override
  String get currency => 'Ft';

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
