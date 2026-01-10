import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/pages/main_page.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/settings_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsVM = SettingsViewModel();
  await settingsVM.loadSettings();

  runApp(MainApp(settingsViewModel: settingsVM));
}

class MainApp extends StatelessWidget {
  final SettingsViewModel settingsViewModel;
  const MainApp({required this.settingsViewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: settingsViewModel,
      child: Consumer<SettingsViewModel>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'Vehicle Cost Tracker',
            debugShowCheckedModeBanner: false,
            locale: settings.locale,
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
      ),
    );
  }
}
