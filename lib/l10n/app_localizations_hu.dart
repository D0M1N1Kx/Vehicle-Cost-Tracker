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
  String get serviceType => 'Szervíz típusa';

  @override
  String get serviceTypeErr => 'Kérlek válassz egy szervíz típust';

  @override
  String get cost => 'Költség';

  @override
  String get costErr => 'Kérlek adj meg egy költséget';

  @override
  String get costErrValid => 'Költségnek egész számnak kell lennie';

  @override
  String get cancel => 'Mégse';

  @override
  String get addService => 'Szerviz hozzáadása';

  @override
  String get emptyGarage => 'A garazsad még üres';

  @override
  String get addANewVehicle =>
      'Adj a garazsadhoz új autót, hogy elkezdhess naplót vezetni!';

  @override
  String get selectVehicle => 'Válassz autót';

  @override
  String get language => 'Nyelv';

  @override
  String get currencyLabel => 'Pénznem';

  @override
  String get distanceUnit => 'Távolsági mértékegység';

  @override
  String get kilometers => 'Kilométer';

  @override
  String get miles => 'Mérföld';

  @override
  String get fuelUnitLabel => 'Üzemanyag mértékegység';

  @override
  String get liters => 'Liter';

  @override
  String get gallons => 'Gallon';

  @override
  String get quickPresets => 'Gyors beállítások';

  @override
  String get noServices => 'Még nem lett szerviz rögzítve';

  @override
  String get maintenanceSchedule => 'Karbantartási ütemezés';

  @override
  String get overdue => 'Lejárt';

  @override
  String get upcoming => 'Közelgő';

  @override
  String get ok => 'OK';

  @override
  String get last => 'Utolsó';

  @override
  String get remaining => 'maradt';

  @override
  String get nextAt => 'Következő';

  @override
  String get daysRemaining => 'nap maradt';

  @override
  String get every => 'Minden';

  @override
  String get kmErr => 'Kérjük adja meg az aktuális km-t';

  @override
  String get kmErrValid => 'A km-nek érvényes szám kell lennie';

  @override
  String get current => 'Aktuális';

  @override
  String get oilChange => 'Olajcsere';

  @override
  String get airFilter => 'Légszűrő';

  @override
  String get pollenFilter => 'Pollenszűrő';

  @override
  String get fuelFilter => 'Üzemanyag szűrő';

  @override
  String get sparkPlug => 'Gyertya';

  @override
  String get brakePadFront => 'Fékbetét Elő';

  @override
  String get brakePadRear => 'Fékbetét Hátsó';

  @override
  String get brakeFluid => 'Fékfolyadék';

  @override
  String get coolant => 'Hűtőfolyadék';

  @override
  String get clutch => 'Kuplungbetét';

  @override
  String get controlBelt => 'Szíj';

  @override
  String get technicalExam => 'Műszaki vizsga';

  @override
  String get unique => 'Egyéb';

  @override
  String get vehDetails => 'Jármű Adatai';
}
