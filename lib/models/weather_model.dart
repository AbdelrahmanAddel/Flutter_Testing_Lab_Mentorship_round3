class WeatherModel {
  final String? city;
  final double? temperatureCelsius;
  final String? description;
  final int? humidity;
  final double? windSpeed;
  final String? icon;

  WeatherModel({
    this.city,
    required this.temperatureCelsius,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['city'] ?? '',
      temperatureCelsius: json['temperature'].toDouble(),
      description: json['description'] ?? '',
      humidity: json['humidity'] ?? 0,
      windSpeed: json['windSpeed'].toDouble(),
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'temperature': temperatureCelsius,
      'description': description,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'icon': icon,
    };
  }
}
