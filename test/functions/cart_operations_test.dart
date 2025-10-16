import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/functions/weather_operations.dart';

void main() {
  late WeatherOperations weatherOperations;
  setUp(() {
    weatherOperations = WeatherOperations();
  });
  group('WeatherOperations -', () {
    test('when valid city is passed then return weather data', () async {
      final weatherData = await weatherOperations.fetchWeatherData('New York');
      expect(weatherData, isNotNull);
      expect(weatherData?.city, 'New York');
      expect(weatherData?.description, isNotNull);
      expect(weatherData?.temperatureCelsius, isNotNull);
      expect(weatherData?.humidity, isNotNull);
      expect(weatherData?.windSpeed, isNotNull);
    });
    test('when invalid city is passed then return null', () async {
      final weatherData = await weatherOperations.fetchWeatherData(
        'Invalid City',
      );
      expect(weatherData, isNull);
    });
    test('When city is null then return null', () async {
      final weatherData = await weatherOperations.fetchWeatherData(null);
      expect(weatherData, isNull);
    });
    test('When Change 30 from celsius to fahrenheit then return 86', () async {
      // arrange
      double cel = 30;
      // act
      final result = weatherOperations.celsiusToFahrenheit(cel);
      // assert
      expect(result, 86);
    });
    test('When Change 86 from fahrenheit to celsius then return 30', () async {
      // arrange
      double fahrenheit = 86;
      // act
      final result = weatherOperations.fahrenheitToCelsius(fahrenheit);
      // assert
      expect(result, 30);
    });
  });
}
