import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/service_type.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/models/maintenance_reminder.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';
import 'package:vehicle_cost_tracker_app/models/service.dart';

class MaintenanceReminderViewModel extends ChangeNotifier {
  final Vehicle vehicle;

  static const Map<ServiceType, (int km, int days)> recommendedIntervals = {
    ServiceType.OilChange: (10000, 365),
    ServiceType.AirFilter: (20000, 730),
    ServiceType.PollenFilter: (20000, 730),
    ServiceType.FuelFilter: (40000, 730),
    ServiceType.SparkPlug: (30000, 730),
    ServiceType.BrakePadFront: (50000, 730),
    ServiceType.BrakePadRear: (50000, 730),
    ServiceType.BrakeFluid: (40000, 730),
    ServiceType.Coolant: (80000, 1095),
    ServiceType.Clutch: (100000, 1095),
    ServiceType.ControlBelt: (60000, 1095),
    ServiceType.TechnicalExam: (0, 365),
  };

  MaintenanceReminderViewModel({required this.vehicle});

  List<MaintenanceReminder> get allReminders {
    final reminders = <MaintenanceReminder>[];

    for (final serviceType in ServiceType.values) {
      if (serviceType == ServiceType.Unique) continue;

      final interval = recommendedIntervals[serviceType];
      if (interval == null) continue;

      final lastService = _getLastServiceOfType(serviceType);

      if (lastService != null) {
        reminders.add(
          MaintenanceReminder(
            serviceType: serviceType.toString().split('.').last,
            recommendedIntervalKm: interval.$1,
            recommendedIntervalDays: interval.$2,
            lastServiceKm: 0,
            lastServiceDate: lastService.date,
            currentKm: vehicle.km,
            currentDate: DateTime.now(),
          ),
        );
      }
    }

    reminders.sort(
      (a, b) => b.urgencyPercentage.compareTo(a.urgencyPercentage),
    );

    return reminders;
  }

  List<MaintenanceReminder> get importantReminders {
    return allReminders.where((r) => r.status != 'Pending').toList();
  }

  MaintenanceReminder? get mostUrgentReminder {
    if (allReminders.isEmpty) return null;
    return allReminders.first;
  }

  Service? _getLastServiceOfType(ServiceType type) {
    if (vehicle.services == null || vehicle.services!.isEmpty) return null;

    final matching = vehicle.services!.where((s) => s.type == type).toList();
    if (matching.isEmpty) return null;

    matching.sort((a, b) => b.date.compareTo(a.date));
    return matching.first;
  }

  int get totalServicesNeeded => importantReminders.length;
  int get overdueCount =>
      importantReminders.where((r) => r.status == 'Overdue').length;
  int get upcomingCount =>
      importantReminders.where((r) => r.status == 'Upcoming').length;
}
