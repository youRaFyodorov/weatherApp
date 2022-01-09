import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_app_for_internship/models/current_weather.dart';

class ShareView extends StatelessWidget {
  final CurrentWeather currentWeather;

  ShareView({required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 120.0,
        height: 50.0,
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
        child: TextButton(
          onPressed: () async { 
            await Share.share('In ${currentWeather.city} now ${currentWeather.main}. Current temperature: ${currentWeather.temp}°C');
          },
          child: Text(
            'Share',
            style: TextStyle(fontSize: 25.0, color: Colors.yellow[700]),
            textAlign: TextAlign.center,
          ),
        ),
      )
    );
  }
}