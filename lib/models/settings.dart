class Settings {
  final String languageCode;
  final String currency;
  final String distanceUnit;
  final String fuelUnit;

  Settings({
    required this.languageCode,
    required this.currency,
    required this.distanceUnit,
    required this.fuelUnit,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    languageCode: json['languageCode'] ?? 'en',
    currency: json['currency'] ?? '\$',
    distanceUnit: json['distanceUnit'] ?? 'km',
    fuelUnit: json['fuelUnit'] ?? 'L',
  );

  Map<String, dynamic> toJson() => {
    'languageCode': languageCode,
    'currency': currency,
    'distanceUnit': distanceUnit,
    'fuelUnit': fuelUnit,
  };

  Settings copyWith({
    String? languageCode,
    String? currency,
    String? distanceUnit,
    String? fuelUnit,
  }) {
    return Settings(
      languageCode: languageCode ?? this.languageCode,
      currency: currency ?? this.currency,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      fuelUnit: fuelUnit ?? this.fuelUnit,
    );
  }
}
