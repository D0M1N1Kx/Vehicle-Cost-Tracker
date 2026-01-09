import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/maintenance_reminder_view_model.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/settings_view_model.dart';

class MaintenanceReminderPage extends StatelessWidget {
  final Vehicle vehicle;

  const MaintenanceReminderPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MaintenanceReminderViewModel(vehicle: vehicle),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '${vehicle.brand} ${vehicle.modell} - ${AppLocalizations.of(context)!.maintenanceReminder}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Consumer<MaintenanceReminderViewModel>(
            builder: (context, viewModel, _) {
              final reminders = viewModel.allReminders;

              if (reminders.isEmpty) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.noServices,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 2.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _SummaryItem(
                                icon: Icons.warning_amber,
                                color: Colors.red,
                                label: AppLocalizations.of(context)!.overdue,
                                value: viewModel.overdueCount.toString(),
                              ),
                              _SummaryItem(
                                icon: Icons.schedule,
                                color: Colors.orange,
                                label: AppLocalizations.of(context)!.upcoming,
                                value: viewModel.upcomingCount.toString(),
                              ),
                              _SummaryItem(
                                icon: Icons.check_circle,
                                color: Colors.green,
                                label: AppLocalizations.of(context)!.ok,
                                value:
                                    (reminders.length -
                                            viewModel.totalServicesNeeded)
                                        .toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.maintenanceSchedule,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              final reminder = reminders[index];
                              return _ReminderCard(reminder: reminder);
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: reminders.length,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _SummaryItem({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class _ReminderCard extends StatelessWidget {
  final reminder;

  const _ReminderCard({required this.reminder});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Overdue':
        return Colors.red;
      case 'Upcoming':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Overdue':
        return Icons.error;
      case 'Upcoming':
        return Icons.warning;
      default:
        return Icons.check_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(reminder.status);
    final statusIcon = _getStatusIcon(reminder.status);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: statusColor, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reminder.serviceType,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${AppLocalizations.of(context)!.last}: ${reminder.lastServiceDate.toString().split(' ')[0]}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Icon(statusIcon, color: statusColor, size: 24),
                      SizedBox(height: 4),
                      Text(
                        reminder.status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: (reminder.urgencyPercentage / 100).clamp(0.0, 1.0),
                minHeight: 8,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${reminder.kmRemaining} ${context.read<SettingsViewModel>().distanceUnit} ${AppLocalizations.of(context)!.remaining}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.nextAt}: ${reminder.lastServiceKm + reminder.recommendedIntervalKm} ${context.read<SettingsViewModel>().distanceUnit}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${reminder.daysRemaining} ${AppLocalizations.of(context)!.daysRemaining}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.every} ${reminder.recommendedIntervalKm} ${context.read<SettingsViewModel>().distanceUnit}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
