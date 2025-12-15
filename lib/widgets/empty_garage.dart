import 'package:flutter/material.dart';

class EmptyGarage extends StatelessWidget {
  const EmptyGarage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.car_crash, size: 62, color: Colors.red),
            SizedBox(height: 20),
            Text(
              'Your garage is empty',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Add a new vehicle to start keeping a maintenance log',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
