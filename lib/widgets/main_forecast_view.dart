import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/widgets/forecast_view.dart';

Widget mainForecastView(BuildContext context, WeatherState state) {
  if(state is WeatherLoadingState) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  if (state is WeatherContentState) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '${state.weather.currentWeather.city}',
          style: TextStyle(color: Colors.black),),
        ),
      body: ListView.builder(
        itemCount: state.weather.forecast.length,
        itemBuilder: (BuildContext context, int index) {
          return forecastView(context, index, state);
        })
    );
  }
  if (state is WeatherErrorState) {
    return Center(
      child: Text(
        '${state.errorMessage}', 
        style: TextStyle(fontSize: 30.0),
        textAlign: TextAlign.center,
      ),
    );
  }
  return Center();
}