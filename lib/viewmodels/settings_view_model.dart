import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  late Locale _locale;
  late String _currency;
  late String _distanceUnit;
  late String _fuelUnit;

  SettingsViewModel() {
    _locale = Locale('en');
    _currency = '\$';
    _distanceUnit = 'km';
    _fuelUnit = "L";
  }

  // GETTERS
  Locale get locale => _locale;
  String get currency => _currency;
  String get distanceUnit => _distanceUnit;
  String get fuelUnit => _fuelUnit;

  // SETTERS
  void setLocale(String languageCode) {
    _locale = Locale(languageCode);
    notifyListeners();
  }

  void setCurrency(String newCurrency) {
    _currency = newCurrency;
    notifyListeners();
  }

  void setDistanceUnit(String unit) {
    _distanceUnit = unit;
    notifyListeners();
  }

  void setFuelUnit(String unit) {
    _fuelUnit = unit;
    notifyListeners();
  }

  void setCountryPreset(String country) {
    switch (country) {
      case 'Hungary':
        setLocale('hu');
        setCurrency('Ft');
        setDistanceUnit('km');
        setFuelUnit('L');
        break;
      case 'USA':
        setLocale('en');
        setCurrency('\$');
        setDistanceUnit('mi');
        setFuelUnit('gal');
        break;
      case 'Germany':
        setLocale('de');
        setCurrency('€');
        setDistanceUnit('km');
        setFuelUnit('L');
        break;
      case 'UK':
        setLocale('en');
        setCurrency('£');
        setDistanceUnit('mi');
        setFuelUnit('gal');
        break;
    }
  }
}
