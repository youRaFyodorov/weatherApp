import 'package:weather_app_for_internship/models/current_weather.dart';
import 'package:weather_app_for_internship/models/weather_every_3h.dart';

class Weather {
  final List<Weather3h> forecast;
  final CurrentWeather currentWeather;

  Weather({required this.forecast, required this.currentWeather});
  
  factory Weather.fromJson(Map<String, dynamic> json) {
    List<dynamic> forecastData = json['list'];
    List<Weather3h> forecast = <Weather3h>[];

    forecastData.forEach((item) {
      forecast.add(Weather3h(
        dt: item['dt'],
        temp: item['main']['temp'].toInt(),
        description: item['weather'][0]['description'],
        icon: item['weather'][0]['icon']
      ));
    });

    var currentWeather = CurrentWeather.fromJson(json);

    return Weather(
      forecast: forecast,
      currentWeather: currentWeather
    );
  }
}