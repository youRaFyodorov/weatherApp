import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/functions/convert_timestamps.dart';
import 'package:weather_app_for_internship/functions/icons.dart';
import 'package:weather_app_for_internship/functions/extensions.dart';

Widget forecast3hBox(BuildContext context, int index, WeatherContentState state) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15.0, right: 40.0, top: 10.0, bottom: 10.0),
        child: Icon(
          getWeatherIcon(state.weather.forecast[index].icon),
          size: 70,
          color: Colors.yellow[600],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${getTimeFromTimestamp(state.weather.forecast[index].dt, state.weather.currentWeather.timezone)}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '${state.weather.forecast[index].description.capitalizeFirstOfEach}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Text(
          '${state.weather.forecast[index].temp}°',
          style: TextStyle(fontSize: 45, color: Colors.blue),
        ),
      ),
    ],
  );
}