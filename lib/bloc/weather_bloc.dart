import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app_for_internship/bloc/weather_event.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/models/weather.dart';
import 'package:weather_app_for_internship/services/current_location_provider.dart';
import 'package:weather_app_for_internship/services/current_weather_api_provider.dart';

const String SOCKET_EXCEPTION_MESSAGE =
    'Error fetching weather. No internet connection.';
const String LOCATION_EXCEPTION_MESSAGE =
    'Error fetching weather. No GPS connection or no permission to use GPS.';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  static const int currentWeatherIndex = 0;
  static const int forecastIndex = 1;
  WeatherProvider weatherProvider;
  CurrentLocationProvider currentLocationProvider;

  WeatherBloc(this.weatherProvider, this.currentLocationProvider)
      : super(InitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is CurrentWeatherLoadEvent) {
      yield* fetchWeather(currentWeatherIndex);
    } else if (event is ForecastWeatherLoadEvent) {
      yield* fetchWeather(forecastIndex);
    }
  }

  Stream<WeatherState> fetchWeather(int index) async* {
    yield WeatherLoadingState(index: index);
    try {
      final LocationData _location =
          await currentLocationProvider.getCurrentLocation();
      final Weather _weather = await weatherProvider.getWeather(_location);
      yield WeatherContentState(weather: _weather, index: index);
    } on SocketException catch (_) {
      yield WeatherErrorState(
          errorMessage: SOCKET_EXCEPTION_MESSAGE, index: index);
    } catch (_) {
      yield WeatherErrorState(
          errorMessage: LOCATION_EXCEPTION_MESSAGE, index: index);
    }
  }
}
