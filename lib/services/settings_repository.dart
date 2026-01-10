import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:vehicle_cost_tracker_app/models/settings.dart';

class SettingsRepository {
  static const String _fileName = 'settings.json';

  Future<String> get _filePath async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$_fileName';
  }

  Future<Settings> loadSettings() async {
    try {
      final filePath = await _filePath;
      final file = File(filePath);

      if (!await file.exists()) {
        return Settings(
          languageCode: 'en',
          currency: '\$',
          distanceUnit: 'km',
          fuelUnit: 'L',
        );
      }

      final contents = await file.readAsString();
      final json = jsonDecode(contents);
      return Settings.fromJson(json);
    } catch (e) {
      print('Error loading settings: $e');
      return Settings(
        languageCode: 'en',
        currency: '\$',
        distanceUnit: 'km',
        fuelUnit: 'L',
      );
    }
  }

  Future<void> saveSettings(Settings settings) async {
    try {
      final filePath = await _filePath;
      final file = File(filePath);

      final json = jsonEncode(settings.toJson());
      await file.writeAsString(json);
      print('Settings saved successfully!');
    } catch (e) {
      print('Error saving settings: $e');
    }
  }
}
