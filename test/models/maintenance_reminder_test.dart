import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_cost_tracker_app/models/maintenance_reminder.dart';

void main() {
  group('MaintenanceReminder', () {
    test('daysRemaining shows correct value when overdue', () {
      final pastDate = DateTime(2024, 1, 1);
      final reminder = MaintenanceReminder(
        serviceType: 'Oil Change',
        recommendedIntervalKm: 10000,
        recommendedIntervalDays: 365,
        lastServiceKm: 50000,
        lastServiceDate: pastDate,
        currentKm: 65000,
      );

      expect(reminder.daysRemaining, lessThan(0));
      expect(reminder.status, 'Overdue');
    });

    test('daysRemaining counts down correctly', () {
      final yesterday = DateTime.now().subtract(Duration(days: 1));
      final reminder = MaintenanceReminder(
        serviceType: 'Oil Change',
        recommendedIntervalKm: 10000,
        recommendedIntervalDays: 365,
        lastServiceKm: 50000,
        lastServiceDate: yesterday,
        currentKm: 55000,
      );

      expect(reminder.daysRemaining, lessThan(365));
    });
  });
}
