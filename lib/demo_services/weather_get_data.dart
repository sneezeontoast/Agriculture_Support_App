//import 'dart:js_interop';

import 'weather_data_api_service.dart';
//import 'dart:async';
//import 'dart:core';
//import 'dart:js_interop';
//import 'package:flutter/material.dart'

void main() async {

  List weatherData = [];
  String response = "";


  //getWeatherData() async {
    var data = await DemoDataApiService().fetchWeatherData(
        latitude: 52.52,
        longitude: 14.41,
        timezone: 'Africa/Cairo',
        pastDays: 0,
        forecastDays: 7);
    //weatherData = data;
  Map<String, dynamic> dailyMeasurements = data;
  //print(weatherData.toString());
    //setState(() {});
  //  return weatherData;
  //}

  print(dailyMeasurements);
  List<String> dates = List<String>.from(dailyMeasurements['time']);
  List<double> temps_max = List<double>.from(dailyMeasurements['temperature_2m_max']);
  List<double> temps_min = List<double>.from(dailyMeasurements['temperature_2m_min']);
  List<double> temps_avg = List<double>.from(dailyMeasurements['temperature_2m_mean']);
  print(dates);
  print(temps_max);
  print(temps_min);
  print(temps_avg);




}