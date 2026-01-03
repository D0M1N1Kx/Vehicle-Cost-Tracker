import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/refueling_view_model.dart';

class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RefuelingViewModel>(
      builder: (context, viewModel, _) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  viewModel.previousMonth();
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
                padding: EdgeInsets.zero,
              ),
              Text(
                viewModel.monthYearDisplay,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () async {
                  viewModel.nextMonth();
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        );
      },
    );
  }
}
