import '../imports.dart';
import 'weather_get_data.dart';
import 'find_weather_from_data.dart';
import '../demo_data/demo_weather_data_model.dart';

class GetWeatherTextService {


  // This needs to now loop through seven days to create a list of a weeks worth of data.

  getWeatherText(int day) async {
    print("Starting...");
  // Setting number of days to include
    int startDay = 8;
//    String text = "";

    // Data is collected from the api and saved to a variable
    var rawData = await getWeatherData();

    List weatherData = [];

    String longDesc = "";
    String quickDesc = "";
    String rainfall = "";
    String temperature = "";
    String windSpeed = "";
    String imageNo = "";


   //   List weatherForText = [
   //     data[1][date],
     //   data[2][date],
     //   data[3][date]
     // ];
  //    print(weatherForText.toString());
  //    l = findWeather(weatherForText);

        print("hello bob");
      for( int i = startDay; i < startDay+13; i ++) {
        WeatherDataItem data = WeatherDataItem(longDesc: "", quickDesc: quickDesc, rainfall: rainfall, temperature: temperature, windSpeed: windSpeed, imageNo: imageNo);

        String weatherForText = rawData[4][i].toString();
        quickDesc = wwoToText(weatherForText).toString();


        temperature = 'Temperature: ${data[2][i].toString()}°C';


        _r = 'Rainfall per mm: ${data[1][_n].toString()}';
        r.add(_r);

        _w_s = 'Wind Speed km/h: ${data[3][_n].toString()}';
        w_s.add(_w_s);
        // [4][8]

        _i = "lib/assets/wwo_images/wwo_${data[4][_n]}.png";

        WeatherDataItem data = WeatherDataItem(longDesc: longDesc, quickDesc: quickDesc, rainfall: rainfall, temperature: temperature, windSpeed: windSpeed, imageNo: imageNo);
        weatherData.add(data);

      }




    return weatherData;

  }


}