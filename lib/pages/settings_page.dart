import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<SettingsViewModel>(
        builder: (context, settingsVM, _) {
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.language, color: Colors.blue),
                  title: Text(AppLocalizations.of(context)!.language),
                  trailing: DropdownButton<String>(
                    value: settingsVM.locale.languageCode,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(child: Text('English'), value: 'en'),
                      DropdownMenuItem(child: Text('Magyar'), value: 'hu'),
                      DropdownMenuItem(child: Text('Deutsch'), value: 'de'),
                      DropdownMenuItem(child: Text('Srbija'), value: 'sr'),
                      DropdownMenuItem(child: Text('Русский'), value: 'ru'),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        settingsVM.setLocale(value);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.green),
                  title: Text(AppLocalizations.of(context)!.currencyLabel),
                  trailing: DropdownButton<String>(
                    value: settingsVM.currency,
                    items: [
                      DropdownMenuItem(child: Text('USD (\$)'), value: '\$'),
                      DropdownMenuItem(child: Text('EUR (\€)'), value: '€'),
                      DropdownMenuItem(child: Text('HUF (Ft)'), value: 'Ft'),
                      DropdownMenuItem(child: Text('GBP (£)'), value: '£'),
                      DropdownMenuItem(child: Text('RSD (din)'), value: 'din'),
                      DropdownMenuItem(child: Text('RUB (₽)'), value: '₽'),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        settingsVM.setCurrency(value);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.straighten, color: Colors.orange),
                  title: Text(AppLocalizations.of(context)!.distanceUnit),
                  trailing: DropdownButton<String>(
                    value: settingsVM.distanceUnit,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(
                        child: Text(AppLocalizations.of(context)!.kilometers),
                        value: 'km',
                      ),
                      DropdownMenuItem(
                        child: Text(AppLocalizations.of(context)!.miles),
                        value: 'mi',
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        settingsVM.setDistanceUnit(value);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.local_gas_station, color: Colors.cyan),
                  title: Text(AppLocalizations.of(context)!.fuelUnitLabel),
                  trailing: DropdownButton<String>(
                    value: settingsVM.fuelUnit,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: 'L',
                        child: Text(AppLocalizations.of(context)!.liters),
                      ),
                      DropdownMenuItem(
                        value: 'gal',
                        child: Text(AppLocalizations.of(context)!.gallons),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        settingsVM.setFuelUnit(value);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 32),

              Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 12.0),
                child: Text(
                  AppLocalizations.of(context)!.quickPresets,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children:
                    ['Hungary', 'USA', 'Germany', 'UK', 'Srbija', 'Русский']
                        .map(
                          (country) => ElevatedButton(
                            onPressed: () {
                              settingsVM.setCountryPreset(country);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$country settings applied'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(country),
                          ),
                        )
                        .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
