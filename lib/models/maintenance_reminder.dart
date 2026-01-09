class MaintenanceReminder {
  final String serviceType;
  final int recommendedIntervalKm;
  final int recommendedIntervalDays;
  final int lastServiceKm;
  final DateTime lastServiceDate;
  final int currentKm;
  final DateTime currentDate;

  MaintenanceReminder({
    required this.serviceType,
    required this.recommendedIntervalKm,
    required this.recommendedIntervalDays,
    required this.lastServiceKm,
    required this.lastServiceDate,
    required this.currentKm,
    required this.currentDate,
  });

  int get kmRemaining {
    final nextServiceKm = lastServiceKm + recommendedIntervalKm;
    return (nextServiceKm - currentKm).clamp(0, recommendedIntervalKm);
  }

  int get daysRemaining {
    final nextServiceDate = lastServiceDate.add(
      Duration(days: recommendedIntervalDays),
    );
    return nextServiceDate
        .difference(currentDate)
        .inDays
        .clamp(0, recommendedIntervalDays);
  }

  int get urgencyPercentage {
    final kmProgress =
        ((currentKm - lastServiceKm) / recommendedIntervalKm * 100).toInt();
    final daysProgress =
        ((currentDate.difference(lastServiceDate).inDays) /
                recommendedIntervalDays *
                100)
            .toInt();

    return (kmProgress > daysProgress ? kmProgress : daysProgress).clamp(
      0,
      200,
    );
  }

  String get status {
    if (urgencyPercentage >= 100) {
      return 'Overdue';
    } else if (urgencyPercentage >= 80) {
      return 'Upcoming';
    } else {
      return 'Pending';
    }
  }

  String get statusColor {
    switch (status) {
      case 'Overdue':
        return 'red';
      case 'Upcoming':
        return 'orange';
      default:
        return 'green';
    }
  }
}
