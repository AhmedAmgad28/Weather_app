import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  String tempState;
  double currentTemp;
  double maxTemp;
  double minTemp;

  WeatherModel(
      {required this.date,
      required this.tempState,
      required this.currentTemp,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(dynamic data) {
    var forcastJson = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        tempState: forcastJson['condition']['text'],
        currentTemp: data['current']['temp_c'],
        maxTemp: forcastJson['maxtemp_c'],
        minTemp: forcastJson['mintemp_c']);
  }

  String getImage() {
    if (tempState == 'Clear' || tempState == 'Light cloud') {
      return 'assets/images/clear.png';
    } else if (tempState == 'Sleet' ||
        tempState == 'Snow' ||
        tempState == 'Hail') {
      return 'assets/images/snow.png';
    } else if (tempState == 'Light rain' ||
        tempState == 'Heavy rain' ||
        tempState == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (tempState == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (tempState == 'Thunderstorm' || tempState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (tempState == 'Clear' || tempState == 'Light cloud') {
      return Colors.orange;
    } else if (tempState == 'Sleet' ||
        tempState == 'Snow' ||
        tempState == 'Hail') {
      return Colors.blue;
    } else if (tempState == 'Light rain' ||
        tempState == 'Heavy rain' ||
        tempState == 'Showers') {
      return Colors.blueGrey;
    } else if (tempState == 'Heavy Cloud') {
      return Colors.blue;
    } else if (tempState == 'Thunderstorm' || tempState == 'Thunder') {
      return Colors.blueGrey;
    } else {
      return Colors.orange;
    }
  }
}
