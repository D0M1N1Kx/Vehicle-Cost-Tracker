# 🚗 Vehicle Cost Tracker

A comprehensive Flutter application for managing vehicle maintenance costs, fuel expenses, and service records. Track everything about your car in one place with multi-language support and customizable settings.

## 📱 Features

### Core Functionality
- **🏠 Garage Management** - Add, edit, and delete multiple vehicles
- **⛽ Refueling Log** - Track fuel consumption and costs with monthly statistics
- **🔧 Service Log** - Record maintenance and repairs with detailed information
- **🚨 Maintenance Reminders** - Get notified when services are due (km-based and time-based)
- **📊 Statistics & Analytics** - View monthly and all-time cost breakdowns

### User Experience
- **🌍 Multi-Language Support** - English, Hungarian, German, Serbian, Russian
- **💱 Customizable Currency** - USD, EUR, HUF, GBP, RSD, RUB
- **📏 Flexible Units** - Kilometers or Miles, Liters or Gallons
- **⚙️ Quick Presets** - One-tap country-specific settings
- **🎨 Dark Theme** - Modern Material 3 design with dark mode

## 🛠️ Technical Stack

### Architecture & Patterns
- **MVVM Architecture** - Clean separation of concerns
- **Provider Package** - State management solution
- **Repository Pattern** - Data access layer abstraction

### Frontend
- **Flutter 3.x**
- **Material Design 3**
- **Provider 6.x** - State management
- **Intl** - Internationalization and localization

### Data & Storage
- **JSON Serialization** - Model to JSON conversion
- **File-based Storage** - Local device storage using `path_provider`
- **DateTime Handling** - ISO 8601 date format

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── pages/                    # UI Pages
│   ├── main_page.dart
│   ├── garage_page.dart
│   ├── vehicle_detail_page.dart
│   ├── add_vehicle_page.dart
│   ├── edit_vehicle_page.dart
│   ├── refueling_log_page.dart
│   ├── service_log_page.dart
│   ├── maintenance_reminder_page.dart
│   └── settings_page.dart
├── viewmodels/              # MVVM ViewModels
│   ├── garage_view_model.dart
│   ├── refueling_view_model.dart
│   ├── service_view_model.dart
│   ├── maintenance_reminder_view_model.dart
│   └── settings_view_model.dart
├── models/                  # Data Models
│   ├── vehicle.dart
│   ├── refuel.dart
│   ├── service.dart
│   ├── maintenance_reminder.dart
│   ├── service_type.dart
│   ├── settings.dart
│   └── field_type.dart
├── services/               # Data Access Layer
│   ├── vehicle_repository.dart
│   └── settings_repository.dart
├── widgets/                # Reusable UI Components
│   ├── button_card.dart
│   ├── custom_input_field.dart
│   ├── empty_garage.dart
│   ├── month_selector.dart
│   ├── vehicle_list.dart
│   ├── service_list_tile.dart
│   ├── add_service_dialog.dart
│   └── vehicle_selector_dialog.dart
└── l10n/                   # Localization
    ├── app_localizations.dart
    ├── app_localizations_en.dart
    ├── app_localizations_hu.dart
    ├── app_localizations_de.dart
    ├── app_localizations_sr.dart
    └── app_localizations_ru.dart
```

## 📋 Key Models

### Vehicle
```dart
class Vehicle {
  final int id;
  final String brand;
  final String modell;
  final int km;
  final String color;
  final String licensePlate;
  final int year;
  final String? engine;
  final String? chassisNumber;
  final List<Refuel>? refuels;
  final List<Service>? services;
}
```

### Refuel
Track every fuel purchase with automatic cost calculation:
- Fuel quantity
- Price per unit
- Total cost
- Date

### Service
Log maintenance work with details:
- Service type (Oil Change, Filter replacement, etc.)
- Cost
- Date
- Kilometer reading at service

### Maintenance Reminder
Intelligent reminder system:
- Tracks overdue services
- Time-based (days) and km-based intervals
- Urgency percentage indicator
- Visual status (Overdue, Upcoming, Pending)

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0+
- Dart 3.0+
- Android SDK or iOS SDK

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/D0M1N1Kx/Vehicle-Cost-Tracker.git
cd vehicle-cost-tracker
```

2. **Get dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### For Release Build
```bash
# Android
flutter build apk

# iOS
flutter build ios
```

## 📖 Usage Guide

### Adding a Vehicle
1. Open the app and tap **Garage**
2. Click the **+** button
3. Fill in vehicle details (brand, model, year, engine, color, license plate)
4. Optionally add chassis number
5. Tap **Save**

### Logging Fuel
1. From Main Page, tap **Refueling Log**
2. Select vehicle if you have multiple
3. Enter fuel quantity and price
4. Cost is calculated automatically
5. View monthly statistics and history

### Recording Services
1. Tap **Service Log** from Main Page
2. Click **+ New Service**
3. Select service type from dropdown
4. Enter cost and current kilometer reading
5. View combined service and refuel history

### Maintenance Reminders
1. Tap **Maintenance Reminder**
2. View all scheduled services
3. See urgency status:
   - 🔴 **Overdue** - Service past due date/km
   - 🟠 **Upcoming** - Service due soon
   - 🟢 **Pending** - Service not yet due

### Settings
Customize app behavior:
- **Language** - Switch between 5 languages
- **Currency** - Select your currency
- **Distance Unit** - Kilometers or Miles
- **Fuel Unit** - Liters or Gallons
- **Quick Presets** - One-tap country settings

## 🧠 Architecture Highlights

### MVVM Pattern
Each screen has a corresponding ViewModel:
- **View** - Flutter UI (Pages and Widgets)
- **ViewModel** - Business logic and state management
- **Model** - Data classes with JSON serialization

Example Flow:
```
UI (Page) → ViewModel (Provider) → Repository → File Storage
   ↑                                              ↓
   └──────────────────── JSON Data ──────────────┘
```

### Provider State Management
- `ChangeNotifier` for reactive updates
- `Consumer` widgets for listening to changes
- `context.read()` for one-time access
- `context.watch()` for reactive rebuilds

### Repository Pattern
Abstraction of data access:
- `VehicleRepository` - Vehicle CRUD operations
- `SettingsRepository` - User preferences storage
- Separated from UI logic
- Easy to test and swap implementations

## 🌐 Localization

Supports 5 languages with full translations:
- 🇬🇧 English
- 🇭🇺 Hungarian (Magyar)
- 🇩🇪 German (Deutsch)
- 🇷🇸 Serbian (Srbija)
- 🇷🇺 Russian (Русский)

All strings are managed in `app_*.arb` files and generated as Dart code.

## 🔮 Future Enhancements

- [ ] Export/Import data (CSV, PDF)
- [ ] Cloud sync with Firebase
- [ ] More detailed statistics and charts
- [ ] Reminders with push notifications
- [ ] Receipt photo storage
- [ ] Dark/Light theme toggle
- [ ] Custom service types

## 📄 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 👨‍💻 Author

Created in 2 months as a learning project for Flutter development.

**Key Technologies Learned:**
- Flutter & Dart
- MVVM Architecture
- Provider State Management
- JSON Data Handling
- Localization Systems
- File-based Storage
- Complex UI Components

## 📞 Support

If you have any questions or issues, please open an issue on GitHub.

---

**Happy tracking! 🚗💨**
