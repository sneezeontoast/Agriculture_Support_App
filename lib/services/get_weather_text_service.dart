import '../imports.dart';
import 'weather_get_data.dart';
import 'find_weather_from_data.dart';
import '../demo_data/demo_weather_data_model.dart';

class GetWeatherTextService {


  // This needs to now loop through seven days to create a list of a weeks worth of data.

  getWeatherText(int startDay, int endDay) async {
    print("Starting...");
  // Setting number of days to include

//    String text = "";

    // Data is collected from the api and saved to a variable
    var rawData = await getWeatherData();

    List<WeatherDataItem> weatherData = [];

    String longDesc = "";
    String quickDesc = "";
    String rainfall = "";
    String temperature = "";
    String windSpeed = "";
    String imageNo = "";

      for( int i = startDay; i < endDay; i ++) {
        WeatherDataItem data = WeatherDataItem(longDesc: "", quickDesc: quickDesc, rainfall: rainfall, temperature: temperature, windSpeed: windSpeed, imageNo: imageNo);

        String weatherForText = rawData[4][i].toString();
        quickDesc = wwoToText(weatherForText).toString();

        temperature = 'Temperature: ${rawData[2][i].toString()}°C';

        rainfall = 'Rainfall per mm: ${rawData[1][i].toString()}';

        windSpeed = 'Wind Speed km/h: ${rawData[3][i].toString()}';

        imageNo = "lib/assets/wwo_images/wwo_${rawData[4][i]}.png";

        data = WeatherDataItem(longDesc: longDesc, quickDesc: quickDesc, rainfall: rainfall, temperature: temperature, windSpeed: windSpeed, imageNo: imageNo);
        weatherData.add(data);
      }

    return weatherData;

  }


}