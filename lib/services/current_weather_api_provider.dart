import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather_app_for_internship/models/weather.dart';

class WeatherProvider {

  Future<Weather> getWeather(LocationData _location) async {

    Weather weather;
    String lat = '${_location.latitude}';   
    String lon = '${_location.longitude}';
    String apiKey = "2bc45f11957b603c5c87a6c0bba118f1";
    var url = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    final response  = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      final weatherJson = json.decode(response.body);
      weather = Weather.fromJson(weatherJson);
      return weather;
    } else {
      throw Exception("Error fetching weather");
    }
  }
}