import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/functions/icons.dart';
import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';

Widget currentWeatherView(BuildContext context, WeatherContentState state) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Icon(
          getWeatherIcon(state.weather.currentWeather.icon),
          size: 150.0,
          color: Colors.yellow[600],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 60.0, right: 60.0, top: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(
                CustomIcons.direction,
                size: 20.0,
                color: Colors.green,
            ),
            ),
            Expanded(
              child: Text(
                '${state.weather.currentWeather.city}, ${state.weather.currentWeather.country}',
                style: TextStyle(fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          '${state.weather.currentWeather.temp}°C | ${state.weather.currentWeather.main}',
          style: TextStyle(fontSize: 30.0, color: Colors.blue),
        ),
      ),
    ],
  );
}