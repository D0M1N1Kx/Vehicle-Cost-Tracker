import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';

enum ServiceType {
  Unique,
  OilChange,
  AirFilter,
  PollenFilter,
  FuelFilter,
  SparkPlug,
  BrakePadFront,
  BrakePadRear,
  BrakeFluid,
  Coolant,
  Clutch,
  ControlBelt,
  TechnicalExam,
}

extension ServiceTypeLocalization on ServiceType {
  String toLocalizedString(AppLocalizations localizations) {
    switch (this) {
      case ServiceType.OilChange:
        return localizations.oilChange;
      case ServiceType.AirFilter:
        return localizations.airFilter;
      case ServiceType.PollenFilter:
        return localizations.pollenFilter;
      case ServiceType.FuelFilter:
        return localizations.fuelFilter;
      case ServiceType.SparkPlug:
        return localizations.sparkPlug;
      case ServiceType.BrakePadFront:
        return localizations.brakePadFront;
      case ServiceType.BrakePadRear:
        return localizations.brakePadRear;
      case ServiceType.BrakeFluid:
        return localizations.brakeFluid;
      case ServiceType.Coolant:
        return localizations.coolant;
      case ServiceType.Clutch:
        return localizations.clutch;
      case ServiceType.ControlBelt:
        return localizations.controlBelt;
      case ServiceType.TechnicalExam:
        return localizations.technicalExam;
      case ServiceType.Unique:
        return localizations.unique;
    }
  }
}
