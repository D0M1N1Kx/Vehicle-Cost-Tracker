import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/pages/main_page.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/settings_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      builder: (context, child) {
        return Consumer<SettingsViewModel>(
          builder: (context, settingsVM, _) {
            return MaterialApp(
              title: 'Vehicle Cost Tracker',
              debugShowCheckedModeBanner: false,
              locale: settingsVM.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('hu'),
                Locale('de'),
                Locale('sr'),
                Locale('ru'),
              ],
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
          },
        );
      },
    );
  }
}
