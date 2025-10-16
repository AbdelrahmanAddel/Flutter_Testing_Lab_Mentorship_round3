import 'package:flutter_testing_lab/models/weather_model.dart';

class WeatherOperations {
  final List<String> _cities = ['New York', 'London', 'Tokyo', 'Invalid City'];
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  // Simulate API call that sometimes returns null or malformed data
  Future<WeatherModel?> fetchWeatherData(String? city) async {
    await Future.delayed(const Duration(seconds: 2));

    if (city == 'Invalid City' || city == null) {
      return null;
    }

    if (DateTime.now().millisecond % 4 == 0) {
      return WeatherModel(
        city: city,
        temperatureCelsius: 22.5,
        description: 'Sunny',
        humidity: 65,
        windSpeed: 12.3,
        icon: '☀️',
      );
    }

    return WeatherModel(
      city: city,
      temperatureCelsius: city == 'London'
          ? 15.0
          : (city == 'Tokyo' ? 25.0 : 22.5),
      description: city == 'London'
          ? 'Rainy'
          : (city == 'Tokyo' ? 'Cloudy' : 'Sunny'),
      humidity: city == 'London' ? 85 : (city == 'Tokyo' ? 70 : 65),
      windSpeed: city == 'London' ? 8.5 : (city == 'Tokyo' ? 5.2 : 12.3),
      icon: city == 'London' ? '🌧️' : (city == 'Tokyo' ? '☁️' : '☀️'),
    );
  }

  List<String> get cities => _cities;
}
