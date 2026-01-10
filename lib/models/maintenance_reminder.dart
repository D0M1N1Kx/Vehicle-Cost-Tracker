class MaintenanceReminder {
  final String serviceType;
  final int recommendedIntervalKm;
  final int recommendedIntervalDays;
  final int? lastServiceKm;
  final DateTime lastServiceDate;
  final int currentKm;

  MaintenanceReminder({
    required this.serviceType,
    required this.recommendedIntervalKm,
    required this.recommendedIntervalDays,
    required this.lastServiceKm,
    required this.lastServiceDate,
    required this.currentKm,
  });

  int get kmRemaining {
    // If we don't know the km at service time, report the full interval as remaining
    // so km-based metric doesn't incorrectly show 'no progress'.
    if (lastServiceKm == null) return recommendedIntervalKm;

    final nextServiceKm = lastServiceKm! + recommendedIntervalKm;
    return (nextServiceKm - currentKm).clamp(0, recommendedIntervalKm);
  }

  int get daysRemaining {
    final nextServiceDate = lastServiceDate.add(
      Duration(days: recommendedIntervalDays),
    );

    final remainingSeconds = nextServiceDate
        .difference(DateTime.now())
        .inSeconds;
    final remainingDays = (remainingSeconds / 86400).ceil();

    return remainingDays;
  }

  int get urgencyPercentage {
    // If km at service isn't known or interval is 0, only use day-based progress.
    final int kmProgress = (lastServiceKm == null || recommendedIntervalKm == 0)
        ? 0
        : ((currentKm - lastServiceKm!) / recommendedIntervalKm * 100).toInt();

    final daysProgress =
        ((DateTime.now().difference(lastServiceDate).inDays) /
                (recommendedIntervalDays == 0 ? 1 : recommendedIntervalDays) *
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
