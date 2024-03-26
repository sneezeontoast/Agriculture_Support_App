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
  List<double> tempsMax = List<double>.from(dailyMeasurements['temperature_2m_max']);
  List<double> tempsMin = List<double>.from(dailyMeasurements['temperature_2m_min']);
  List<double> tempsAvg = List<double>.from(dailyMeasurements['temperature_2m_mean']);
  List<double> windSpeed10mMax = List<double>.from(dailyMeasurements['wind_speed_10m_max']);
  List<double> precipitationSum = List<double>.from(dailyMeasurements['precipitation_sum']);
  List<double> sunshineDuration = List<double>.from(dailyMeasurements['sunshine_duration']);
  List<double> weatherCode = List<double>.from(dailyMeasurements['weather_code']);

  weatherData = [dates,precipitationSum,sunshineDuration,windSpeed10mMax,tempsMax,tempsMin,tempsAvg];
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