import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Cost Tracker',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
          surface: Colors.grey.shade900,
        ),
        useMaterial3: true,
      ),

      themeMode: ThemeMode.dark,
      theme: ThemeData(),

      home: MainPage(),
    );
  }
}
