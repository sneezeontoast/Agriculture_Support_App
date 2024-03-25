//import 'dart:js_interop';

import 'weather_data_api_service.dart';
//import 'dart:async';
//import 'dart:core';
//import 'dart:js_interop';
//import 'package:flutter/material.dart'

getWeatherDataD() async {

  List weatherData = [];
  String response = "";


  //getWeatherData() async {
    var data = await DemoDataApiService().fetchWeatherData(
        latitude: 52.52,
        longitude: 14.41,
        timezone: 'Africa/Cairo',
        pastDays: 7,
        forecastDays: 14);
    //weatherData = data;
  Map<String, dynamic> dailyMeasurements = data;
  //print(weatherData.toString());
    //setState(() {});
  //  return weatherData;
  //}


  //print(dailyMeasurements);
  List<String> dates = List<String>.from(dailyMeasurements['time']);
  List<double> temps_max = List<double>.from(dailyMeasurements['temperature_2m_max']);
  List<double> temps_min = List<double>.from(dailyMeasurements['temperature_2m_min']);
  List<double> temps_avg = List<double>.from(dailyMeasurements['temperature_2m_mean']);
  List<double> wind_speed_10m_max = List<double>.from(dailyMeasurements['wind_speed_10m_max']);
  List<double> precipitation_sum = List<double>.from(dailyMeasurements['precipitation_sum']);
  List<double> sunshine_duration = List<double>.from(dailyMeasurements['sunshine_duration']);
  List<double> weather_code = List<double>.from(dailyMeasurements['weather_code']);

  weatherData = [dates,precipitation_sum,sunshine_duration,wind_speed_10m_max,temps_max,temps_min,temps_avg];
  List weatherForText = [weatherData[0][8], weatherData[1][8], weatherData[2][8]];
  /* print(dates);
  print(temps_max);
  print(temps_min);
  print(temps_avg);
 */
  // print("weather "+ data);
  // print("weatherData: "+weatherData[]);
  return weatherData; //



}