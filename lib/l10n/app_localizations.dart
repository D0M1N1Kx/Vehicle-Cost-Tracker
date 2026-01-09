import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('hu'),
    Locale('ru'),
    Locale('sr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Cost Tracker'**
  String get appTitle;

  /// No description provided for @garage.
  ///
  /// In en, this message translates to:
  /// **'Garage'**
  String get garage;

  /// No description provided for @garageSub.
  ///
  /// In en, this message translates to:
  /// **'Managing and modifying your cars'**
  String get garageSub;

  /// No description provided for @maintenanceReminder.
  ///
  /// In en, this message translates to:
  /// **'Maintenance reminder'**
  String get maintenanceReminder;

  /// No description provided for @maintenanceSub.
  ///
  /// In en, this message translates to:
  /// **'Recorded statuses and due dates'**
  String get maintenanceSub;

  /// No description provided for @noVehFound.
  ///
  /// In en, this message translates to:
  /// **'No vehicles found. Please add a vehicle first.'**
  String get noVehFound;

  /// No description provided for @refuelingLog.
  ///
  /// In en, this message translates to:
  /// **'Refueling Log'**
  String get refuelingLog;

  /// No description provided for @refuelingSub.
  ///
  /// In en, this message translates to:
  /// **'Tracking monthly fuel costs'**
  String get refuelingSub;

  /// No description provided for @serviceLog.
  ///
  /// In en, this message translates to:
  /// **'Service Log'**
  String get serviceLog;

  /// No description provided for @serviceSub.
  ///
  /// In en, this message translates to:
  /// **'Repairs carried out and their costs'**
  String get serviceSub;

  /// No description provided for @monthlyCost.
  ///
  /// In en, this message translates to:
  /// **'Monthly Cost'**
  String get monthlyCost;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get totalCost;

  /// No description provided for @fuelQuantity.
  ///
  /// In en, this message translates to:
  /// **'Fuel Quantity'**
  String get fuelQuantity;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsSub.
  ///
  /// In en, this message translates to:
  /// **'Languages, currency, units and other options'**
  String get settingsSub;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'\$'**
  String get currency;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get unit;

  /// No description provided for @fuelUnit.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get fuelUnit;

  /// No description provided for @addVehicle.
  ///
  /// In en, this message translates to:
  /// **'Add Vehicle'**
  String get addVehicle;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @brandErr.
  ///
  /// In en, this message translates to:
  /// **'Please select a brand'**
  String get brandErr;

  /// No description provided for @modell.
  ///
  /// In en, this message translates to:
  /// **'Modell'**
  String get modell;

  /// No description provided for @modellErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter a model name'**
  String get modellErr;

  /// No description provided for @engineType.
  ///
  /// In en, this message translates to:
  /// **'Engine type'**
  String get engineType;

  /// No description provided for @engineTypeErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter engine type'**
  String get engineTypeErr;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @colorErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter color'**
  String get colorErr;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @yearErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter a year'**
  String get yearErr;

  /// No description provided for @yearErrValid.
  ///
  /// In en, this message translates to:
  /// **'Year must be a valid number'**
  String get yearErrValid;

  /// No description provided for @odometer.
  ///
  /// In en, this message translates to:
  /// **'Odometer reading'**
  String get odometer;

  /// No description provided for @odometerErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter odometer reading'**
  String get odometerErr;

  /// No description provided for @odometerErrValid.
  ///
  /// In en, this message translates to:
  /// **'Odometer must be a valid number'**
  String get odometerErrValid;

  /// No description provided for @licensePlate.
  ///
  /// In en, this message translates to:
  /// **'License plate'**
  String get licensePlate;

  /// No description provided for @licensePlateErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter license plate'**
  String get licensePlateErr;

  /// No description provided for @chassisNumber.
  ///
  /// In en, this message translates to:
  /// **'Chassis number (optional)'**
  String get chassisNumber;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @fuelQuantityErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter fuel quantity'**
  String get fuelQuantityErr;

  /// No description provided for @fuelPriceErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter fuel price'**
  String get fuelPriceErr;

  /// No description provided for @fuelQuantityErrValid.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be a valid number'**
  String get fuelQuantityErrValid;

  /// No description provided for @fuelPriceErrValid.
  ///
  /// In en, this message translates to:
  /// **'Price must be a valid number'**
  String get fuelPriceErrValid;

  /// No description provided for @fuelQuantityErrGreater.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be greater than 0'**
  String get fuelQuantityErrGreater;

  /// No description provided for @fuelPriceErrGreater.
  ///
  /// In en, this message translates to:
  /// **'Price must be greater than 0'**
  String get fuelPriceErrGreater;

  /// No description provided for @refuelSaved.
  ///
  /// In en, this message translates to:
  /// **'Refuel saved!'**
  String get refuelSaved;

  /// No description provided for @refueling.
  ///
  /// In en, this message translates to:
  /// **'Refueling'**
  String get refueling;

  /// No description provided for @avgPerFill.
  ///
  /// In en, this message translates to:
  /// **'Avg Per Fill'**
  String get avgPerFill;

  /// No description provided for @monthlyLiters.
  ///
  /// In en, this message translates to:
  /// **'Monthly Liters'**
  String get monthlyLiters;

  /// No description provided for @newRefuelLog.
  ///
  /// In en, this message translates to:
  /// **'New refuel log'**
  String get newRefuelLog;

  /// No description provided for @fuelPrice.
  ///
  /// In en, this message translates to:
  /// **'Fuel Price'**
  String get fuelPrice;

  /// No description provided for @fuelCost.
  ///
  /// In en, this message translates to:
  /// **'Fuel Cost'**
  String get fuelCost;

  /// No description provided for @noRefuelsInThisMonth.
  ///
  /// In en, this message translates to:
  /// **'No refuels in this month'**
  String get noRefuelsInThisMonth;

  /// No description provided for @refuelsThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Refuels this month'**
  String get refuelsThisMonth;

  /// No description provided for @allServices.
  ///
  /// In en, this message translates to:
  /// **'All services'**
  String get allServices;

  /// No description provided for @allCosts.
  ///
  /// In en, this message translates to:
  /// **'All costs'**
  String get allCosts;

  /// No description provided for @newServiceLog.
  ///
  /// In en, this message translates to:
  /// **'New service log'**
  String get newServiceLog;

  /// No description provided for @noServicesOrRefuels.
  ///
  /// In en, this message translates to:
  /// **'No services or refuels recorded'**
  String get noServicesOrRefuels;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// No description provided for @serviceTypeErr.
  ///
  /// In en, this message translates to:
  /// **'Please select a service type'**
  String get serviceTypeErr;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @costErr.
  ///
  /// In en, this message translates to:
  /// **'Please enter a cost'**
  String get costErr;

  /// No description provided for @costErrValid.
  ///
  /// In en, this message translates to:
  /// **'Cost must be a valid number'**
  String get costErrValid;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @addService.
  ///
  /// In en, this message translates to:
  /// **'Add Service'**
  String get addService;

  /// No description provided for @emptyGarage.
  ///
  /// In en, this message translates to:
  /// **'Your garage is empty'**
  String get emptyGarage;

  /// No description provided for @addANewVehicle.
  ///
  /// In en, this message translates to:
  /// **'Add a new vehicle to start keeping a maintenance log'**
  String get addANewVehicle;

  /// No description provided for @selectVehicle.
  ///
  /// In en, this message translates to:
  /// **'Select Vehicle'**
  String get selectVehicle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @currencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currencyLabel;

  /// No description provided for @distanceUnit.
  ///
  /// In en, this message translates to:
  /// **'Distance unit'**
  String get distanceUnit;

  /// No description provided for @kilometers.
  ///
  /// In en, this message translates to:
  /// **'kilometers'**
  String get kilometers;

  /// No description provided for @miles.
  ///
  /// In en, this message translates to:
  /// **'miles'**
  String get miles;

  /// No description provided for @fuelUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Fuel unit'**
  String get fuelUnitLabel;

  /// No description provided for @liters.
  ///
  /// In en, this message translates to:
  /// **'liters'**
  String get liters;

  /// No description provided for @gallons.
  ///
  /// In en, this message translates to:
  /// **'gallons'**
  String get gallons;

  /// No description provided for @quickPresets.
  ///
  /// In en, this message translates to:
  /// **'Quick presets'**
  String get quickPresets;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'hu', 'ru', 'sr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'hu':
      return AppLocalizationsHu();
    case 'ru':
      return AppLocalizationsRu();
    case 'sr':
      return AppLocalizationsSr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
