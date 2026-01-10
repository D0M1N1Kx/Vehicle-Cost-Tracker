// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Отслеживание Расходов Автомобиля';

  @override
  String get garage => 'Гараж';

  @override
  String get garageSub => 'Управление и изменение ваших автомобилей';

  @override
  String get maintenanceReminder => 'Напоминание о техническом обслуживании';

  @override
  String get maintenanceSub => 'Записанные статусы и сроки';

  @override
  String get noVehFound =>
      'Автомобили не найдены. Сначала добавьте автомобиль.';

  @override
  String get refuelingLog => 'Журнал заправок';

  @override
  String get refuelingSub => 'Отслеживание ежемесячных расходов на топливо';

  @override
  String get serviceLog => 'Журнал обслуживания';

  @override
  String get serviceSub => 'Выполненные ремонты и их стоимость';

  @override
  String get monthlyCost => 'Ежемесячные расходы';

  @override
  String get totalCost => 'Общая стоимость';

  @override
  String get fuelQuantity => 'Количество топлива';

  @override
  String get settings => 'Настройки';

  @override
  String get settingsSub => 'Языки, валюта, единицы измерения и другие опции';

  @override
  String get currency => '\$';

  @override
  String get unit => 'км';

  @override
  String get fuelUnit => 'л';

  @override
  String get addVehicle => 'Добавить автомобиль';

  @override
  String get brand => 'Марка';

  @override
  String get brandErr => 'Пожалуйста, выберите марку';

  @override
  String get modell => 'Модель';

  @override
  String get modellErr => 'Пожалуйста, введите название модели';

  @override
  String get engineType => 'Тип двигателя';

  @override
  String get engineTypeErr => 'Пожалуйста, введите тип двигателя';

  @override
  String get color => 'Цвет';

  @override
  String get colorErr => 'Пожалуйста, введите цвет';

  @override
  String get year => 'Год';

  @override
  String get yearErr => 'Пожалуйста, введите год';

  @override
  String get yearErrValid => 'Год должен быть действительным числом';

  @override
  String get odometer => 'Показания одометра';

  @override
  String get odometerErr => 'Пожалуйста, введите показания одометра';

  @override
  String get odometerErrValid =>
      'Показания одометра должны быть действительным числом';

  @override
  String get licensePlate => 'Номерной знак';

  @override
  String get licensePlateErr => 'Пожалуйста, введите номерной знак';

  @override
  String get chassisNumber => 'Номер кузова (опционально)';

  @override
  String get save => 'Сохранить';

  @override
  String get fuelQuantityErr => 'Пожалуйста, введите количество топлива';

  @override
  String get fuelPriceErr => 'Пожалуйста, введите цену топлива';

  @override
  String get fuelQuantityErrValid =>
      'Количество должно быть действительным числом';

  @override
  String get fuelPriceErrValid => 'Цена должна быть действительным числом';

  @override
  String get fuelQuantityErrGreater => 'Количество должно быть больше 0';

  @override
  String get fuelPriceErrGreater => 'Цена должна быть больше 0';

  @override
  String get refuelSaved => 'Заправка сохранена!';

  @override
  String get refueling => 'Заправка';

  @override
  String get avgPerFill => 'Средняя заправка';

  @override
  String get monthlyLiters => 'Ежемесячные литры';

  @override
  String get newRefuelLog => 'Новая заправка';

  @override
  String get fuelPrice => 'Цена топлива';

  @override
  String get fuelCost => 'Стоимость топлива';

  @override
  String get noRefuelsInThisMonth => 'Нет заправок в этом месяце';

  @override
  String get refuelsThisMonth => 'Заправки в этом месяце';

  @override
  String get allServices => 'Все обслуживания';

  @override
  String get allCosts => 'Все расходы';

  @override
  String get newServiceLog => 'Новое обслуживание';

  @override
  String get noServicesOrRefuels => 'Обслуживание или заправка не записаны';

  @override
  String get serviceType => 'Тип обслуживания';

  @override
  String get serviceTypeErr => 'Пожалуйста, выберите тип обслуживания';

  @override
  String get cost => 'Стоимость';

  @override
  String get costErr => 'Пожалуйста, введите стоимость';

  @override
  String get costErrValid => 'Стоимость должна быть действительным числом';

  @override
  String get cancel => 'Отмена';

  @override
  String get addService => 'Добавить обслуживание';

  @override
  String get emptyGarage => 'Ваш гараж пуст';

  @override
  String get addANewVehicle =>
      'Добавьте новый автомобиль, чтобы начать вести журнал обслуживания';

  @override
  String get selectVehicle => 'Выберите автомобиль';

  @override
  String get language => 'Язык';

  @override
  String get currencyLabel => 'Валюта';

  @override
  String get distanceUnit => 'Единица расстояния';

  @override
  String get kilometers => 'километры';

  @override
  String get miles => 'мили';

  @override
  String get fuelUnitLabel => 'Единица топлива';

  @override
  String get liters => 'литры';

  @override
  String get gallons => 'галлоны';

  @override
  String get quickPresets => 'Быстрые предустановки';

  @override
  String get noServices => 'Обслуживание еще не записано';

  @override
  String get maintenanceSchedule => 'График обслуживания';

  @override
  String get overdue => 'Просрочено';

  @override
  String get upcoming => 'Предстоящее';

  @override
  String get ok => 'ОК';

  @override
  String get last => 'Последнее';

  @override
  String get remaining => 'осталось';

  @override
  String get nextAt => 'Следующее';

  @override
  String get daysRemaining => 'дней осталось';

  @override
  String get every => 'Каждые';

  @override
  String get kmErr => 'Пожалуйста, введите текущий км';

  @override
  String get kmErrValid => 'Км должен быть действительным числом';

  @override
  String get current => 'Текущий';

  @override
  String get oilChange => 'Замена масла';

  @override
  String get airFilter => 'Воздушный фильтр';

  @override
  String get pollenFilter => 'Салонный фильтр';

  @override
  String get fuelFilter => 'Топливный фильтр';

  @override
  String get sparkPlug => 'Свеча зажигания';

  @override
  String get brakePadFront => 'Тормозные колодки спереди';

  @override
  String get brakePadRear => 'Тормозные колодки сзади';

  @override
  String get brakeFluid => 'Тормозная жидкость';

  @override
  String get coolant => 'Охлаждающая жидкость';

  @override
  String get clutch => 'Сцепление';

  @override
  String get controlBelt => 'Ремень привода';

  @override
  String get technicalExam => 'Техническое ТО';

  @override
  String get unique => 'Прочее';
}
