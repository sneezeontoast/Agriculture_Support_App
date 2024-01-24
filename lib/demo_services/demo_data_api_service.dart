import '../demo_imports.dart';
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
      "daily": ["temperature_2m_max", "daylight_duration", "rain_sum", "showers_sum", "precipitation_probability_max", "wind_speed_10m_max", "et0_fao_evapotranspiration"].join(","),
      "timezone": timezone,
      "past_days": pastDays.toString(),
      "forecast_days": forecastDays.toString(),
    };

    try {
      final response = await http.get(url.replace(queryParameters: params));
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        Map<String, dynamic> dailyUnits = jsonResponse['daily_units'];
        Map<String, dynamic> dailyMeasurements = jsonResponse['daily'];  // daily is a map of measurement lists
        List<Map<String, dynamic>> organizedData = organizeData(dailyUnits, dailyMeasurements);

        return organizedData;
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

  List<Map<String, dynamic>> organizeData(Map<String, dynamic> dailyUnits, Map<String, dynamic> dailyMeasurements) {
    List<Map<String, dynamic>> organizedData = [];

    // Cast the dates list to List<String>
    List<String> dates = List<String>.from(dailyMeasurements['time']);

    int numberOfDays = dates.length;

    for (int i = 0; i < numberOfDays; i++) {
      Map<String, dynamic> dayData = {};
      dayData['date'] = dates[i];  // Set the date for the current day

      dailyUnits.forEach((measurement, unit) {
        // Get the measurement list from dailyMeasurements (e.g., temperature_2m_max, etc.)
        // Cast each measurements list to List<dynamic>
        List<dynamic> measurements = List<dynamic>.from(dailyMeasurements[measurement]);
        if (measurements != null && measurements.length > i) {
          // Format the measurement value and append the unit
          String formattedValue = '${measurements[i]} $unit';
          dayData[measurement] = formattedValue;
        }
      });

      organizedData.add(dayData);
    }

    return organizedData;
  }






}