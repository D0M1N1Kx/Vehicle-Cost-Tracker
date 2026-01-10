import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/settings.dart';
import 'package:vehicle_cost_tracker_app/services/settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  late Settings _settings;
  final SettingsRepository _repository = SettingsRepository();
  bool _isLoading = true;

  SettingsViewModel() {
    _settings = Settings(
      languageCode: 'en',
      currency: '\$',
      distanceUnit: 'km',
      fuelUnit: 'L',
    );
  }

  // GETTERS
  Locale get locale => Locale(_settings.languageCode);
  String get currency => _settings.currency;
  String get distanceUnit => _settings.distanceUnit;
  String get fuelUnit => _settings.fuelUnit;
  bool get isLoading => _isLoading;

  // SETTERS

  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    _settings = await _repository.loadSettings();

    _isLoading = false;
    notifyListeners();
  }

  void setLocale(String languageCode) async {
    _settings = _settings.copyWith(languageCode: languageCode);
    await _repository.saveSettings(_settings);
    notifyListeners();
  }

  void setCurrency(String newCurrency) async {
    _settings = _settings.copyWith(currency: newCurrency);
    await _repository.saveSettings(_settings);
    notifyListeners();
  }

  void setDistanceUnit(String unit) async {
    _settings = _settings.copyWith(distanceUnit: unit);
    await _repository.saveSettings(_settings);
    notifyListeners();
  }

  void setFuelUnit(String unit) async {
    _settings = _settings.copyWith(fuelUnit: unit);
    await _repository.saveSettings(_settings);
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
      case 'Srbija':
        setLocale('sr');
        setCurrency('din');
        setDistanceUnit('km');
        setFuelUnit('L');
      case 'Русский':
        setLocale('ru');
        setCurrency('₽');
        setDistanceUnit('km');
        setFuelUnit('L');
        break;
    }
  }
}
