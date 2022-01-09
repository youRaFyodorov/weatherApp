import 'package:weather_app_for_internship/models/weather.dart';

abstract class WeatherState {
  final int currentIndex;
  
  WeatherState({required this.currentIndex});
}
class InitialState extends WeatherState {
  static const int defoltIndex = 0;

  InitialState() : super(currentIndex: defoltIndex);
}

class WeatherContentState extends WeatherState {
  Weather weather;

  WeatherContentState({required this.weather, required int index}) : super(currentIndex: index);
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState({required int index}) : super(currentIndex: index);
}
class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage,required int index}) : super(currentIndex: index);
}