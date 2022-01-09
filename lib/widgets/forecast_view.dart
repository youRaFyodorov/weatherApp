import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/functions/convert_timestamps.dart';
import 'package:weather_app_for_internship/widgets/forecast_3h_box.dart';
import 'package:weather_app_for_internship/functions/extensions.dart';

Widget forecastView(BuildContext context, int index, WeatherContentState state) {
  if (index == 0) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'TODAY',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2.0
            )
          ),
          child: forecast3hBox(context, index, state)
        ),
      ],
    );
  } else if (index == 1) {
    return forecast3hBox(context, index, state);
  } else {
    if (getDateFromTimestamp(state.weather.forecast[index - 1].dt, state.weather.currentWeather.timezone) == getDateFromTimestamp(state.weather.forecast[index].dt, state.weather.currentWeather.timezone)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 1.0, thickness: 2, indent: 125.0,),
          forecast3hBox(context, index, state),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 1.0, thickness: 2),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              '${getDateFromTimestamp(state.weather.forecast[index].dt, state.weather.currentWeather.timezone).allInCaps}',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Divider(height: 1.0, thickness: 2),
          forecast3hBox(context, index, state),
        ],
      );
    }
  }
}