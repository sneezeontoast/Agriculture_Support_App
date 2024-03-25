//import 'dart:js_interop';

import 'get_weather_data_api.dart';
//import 'dart:async';
//import 'dart:core';
//import 'dart:js_interop';
//import 'package:flutter/material.dart'

getWeatherData() async {

  List weatherData = [];
  String response = "";


  //getWeatherData() async {
  var data = await DemoDataApiService().fetchWeatherData(
      latitude: -15.88,
      longitude: 35,
      timezone: 'Africa/Cairo',
      pastDays: 7,
      forecastDays: 14);
  //weatherData = data;
  Map<String, dynamic> dailyMeasurements = data;
  //print(weatherData.toString());
  //setState(() {});
  //  return weatherData;
  //}

  print("hello");
  //print(dailyMeasurements);
  List<String> dates = List<String>.from(dailyMeasurements['time']);
  List<double> temps_max = List<double>.from(dailyMeasurements['temperature_2m_max']);
  List<double> temps_min = List<double>.from(dailyMeasurements['temperature_2m_min']);
  List<double> temps_avg = List<double>.from(dailyMeasurements['temperature_2m_mean']);
  List<double> wind_speed_10m_max = List<double>.from(dailyMeasurements['wind_speed_10m_max']);
  List<double> precipitation_sum = List<double>.from(dailyMeasurements['precipitation_sum']);
  List<double> sunshine_duration = List<double>.from(dailyMeasurements['sunshine_duration']);
  List<int> weather_code = List<int>.from(dailyMeasurements['weather_code']);
  // List<double> weather_code = List<double>.from(dailyMeasurements['weather_code']);

  weatherData = [dates, precipitation_sum, temps_avg, wind_speed_10m_max, weather_code];
  // List weatherForText = [weatherData[0][8], weatherData[1][8], weatherData[2][8]];
  /* print(dates);
  print(temps_max);
  print(temps_min);
  print(temps_avg);
 */
  // print("weather "+ data);

  // print("weatherData: ${[dates, precipitation_sum, temps_avg, wind_speed_10m_max, weather_code]} ");

  print("weatherData: " + weatherData.toString());
  return weatherData; //



}