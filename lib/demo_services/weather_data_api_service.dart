//import '../demo_imports.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

//------------------------------------------------------------------------------
// This class is a service to manage data from api sources
//------------------------------------------------------------------------------

class DemoDataApiService {
  // Get weather forecast data
  //----------------------------------------------------------------------------

  Future<dynamic> fetchWeatherData({
    required double latitude,
    required double longitude,
    required String timezone,
    required int pastDays,
    required int forecastDays,
  }) async {
    final url = Uri.parse("https://api.open-meteo.com/v1/forecast");
    final params = {
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "daily": [
        "temperature_2m_max",
        "temperature_2m_min",
        "temperature_2m_mean"
      ].join(","),
      "timezone": timezone,
      "past_days": pastDays.toString(),
      "forecast_days": forecastDays.toString(),
    };

    try {
      final response = await http.get(url.replace(queryParameters: params));
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        //print(jsonResponse);
        Map<String, dynamic> dailyUnits = jsonResponse['daily_units'];
        Map<String, dynamic> dailyMeasurements =
            jsonResponse['daily']; // daily is a map of measurement lists

        return dailyMeasurements;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Handle any errors that might occur
      throw Exception('Failed to load weather data: $e');
    }
  }
}
