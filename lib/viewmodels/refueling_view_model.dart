import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/refuel.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';

class RefuelingViewModel extends ChangeNotifier {
  late Vehicle _vehicle;

  late DateTime _selectedDate;

  RefuelingViewModel({required Vehicle vehicle}) {
    _vehicle = vehicle;
    _selectedDate = DateTime.now();
  }

  // GETTERS
  DateTime get selectedDate => _selectedDate;

  int get selectedYear => _selectedDate.year;
  int get selectedMonth => _selectedDate.month;

  String get monthYearDisplay {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${_selectedDate.year} ${months[_selectedDate.month - 1]}';
  }

  List<Refuel> get refuelsForSelectedMonth {
    if (_vehicle.refuels == null) return [];

    return _vehicle.refuels!
        .where(
          (refuel) =>
              refuel.date.year == selectedYear &&
              refuel.date.month == selectedMonth,
        )
        .toList();
  }

  int get monthlyTotalCost {
    return refuelsForSelectedMonth.fold<int>(
      0,
      (sum, refuel) => sum + refuel.fuelCost,
    );
  }

  int get totalCostAllTime {
    if (_vehicle.refuels == null) return 0;
    return _vehicle.refuels!.fold<int>(
      0,
      (sum, refuel) => sum + refuel.fuelCost,
    );
  }

  int get monthlyAverage {
    if (refuelsForSelectedMonth.isEmpty) return 0;
    return (monthlyTotalCost / refuelsForSelectedMonth.length).round();
  }

  int get monthlyTotalLiters {
    return refuelsForSelectedMonth.fold<int>(
      0,
      (sum, refuel) => sum + refuel.fuelQuantity,
    );
  }

  void updateVehicle(Vehicle updatedVehicle) {
    _vehicle = updatedVehicle;
    notifyListeners();
  }

  // METHODS
  void previousMonth() {
    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    notifyListeners();
  }

  void nextMonth() {
    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    notifyListeners();
  }

  void goToCurrentMonth() {
    _selectedDate = DateTime.now();
    notifyListeners();
  }
}
