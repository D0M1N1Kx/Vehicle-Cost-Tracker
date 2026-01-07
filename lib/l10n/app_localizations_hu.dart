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
  String get addVehicle => 'Jármű hozzáadása';

  @override
  String get brand => 'Márka';

  @override
  String get brandErr => 'Kérlek válassz egy márkát';

  @override
  String get modell => 'Modell';

  @override
  String get modellErr => 'Kérlek írj be egy modell nevet';

  @override
  String get engineType => 'Motor típusa';

  @override
  String get engineTypeErr => 'Kérlek írd be a motor típusát';

  @override
  String get color => 'Szín';

  @override
  String get colorErr => 'Kérlek írj be egy színt';

  @override
  String get year => 'Évjárat';

  @override
  String get yearErr => 'Kérlek add meg az évjáratot';

  @override
  String get yearErrValid => 'Az évjáratnak egész számnak kell lennie';

  @override
  String get odometer => 'Kilóméter óra állása';

  @override
  String get odometerErr => 'Kérlek add meg a kilóméter óra állását';

  @override
  String get odometerErrValid =>
      'Kilóméter óra állása egész számnak kell lennie';

  @override
  String get licensePlate => 'Rendszám tábla';

  @override
  String get licensePlateErr => 'Kérlek írd be a rendszám táblát';

  @override
  String get chassisNumber => 'Vázszám (opcionális)';

  @override
  String get save => 'Mentés';

  @override
  String get fuelQuantityErr => 'Kérjük, adja meg az üzemanyag mennyiségét';

  @override
  String get fuelPriceErr => 'Kérjük, adja meg az üzemanyag árát';

  @override
  String get fuelQuantityErrValid =>
      'A mennyiségnek érvényes számnak kell lennie.';

  @override
  String get fuelPriceErrValid => 'Az árnak érvényes számnak kell lennie.';

  @override
  String get fuelQuantityErrGreater =>
      'A mennyiségnek nagyobbnak kell lennie, mint 0';

  @override
  String get fuelPriceErrGreater => 'Az árnak nagyobbnak kell lennie, mint 0';

  @override
  String get refuelSaved => 'Tankolás elmentve!';

  @override
  String get refueling => 'Tankolás';

  @override
  String get avgPerFill => 'Átlagos ár tankolásonként';

  @override
  String get monthlyLiters => 'Havi liter';

  @override
  String get newRefuelLog => 'Új tankolási napló';

  @override
  String get fuelPrice => 'Üzemanyagár';

  @override
  String get fuelCost => 'Üzemanyagköltség';

  @override
  String get noRefuelsInThisMonth => 'Nincs tankolás ebben a hónapban';

  @override
  String get refuelsThisMonth => 'Tankolás ebben a hónapban';

  @override
  String get allServices => 'Összes szervíz';

  @override
  String get allCosts => 'Összes költség';

  @override
  String get newServiceLog => 'Új szervíz';

  @override
  String get noServicesOrRefuels => 'Nincsen szervíz vagy tankolás feljegyezve';

  @override
  String get serviceType => 'Service Type';

  @override
  String get serviceTypeErr => 'Please select a service type';

  @override
  String get cost => 'Cost';

  @override
  String get costErr => 'Please enter a cost';

  @override
  String get costErrValid => 'Cost must be a valid number';

  @override
  String get cancel => 'Cancel';

  @override
  String get addService => 'Add Service';
}
