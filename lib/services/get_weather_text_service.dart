import '../imports.dart';
import 'weather_get_data.dart';
import 'find_weather_from_data.dart';

class GetWeatherTextService {


  // This needs to now loop through seven days to create a list of a weeks worth of data.

  getWeatherText(int day) async {
    print("Starting...");
    int date = 8 + day;
    print(date.toString());
    String text = "";

    // Data is collected from the api and saved to a variable
    var data = await getWeatherData();

    String l = "";
    String q = "";
    String r = "";
    String t = "";
    String w_s = "";
    String i = "";


   //   List weatherForText = [
   //     data[1][date],
     //   data[2][date],
     //   data[3][date]
     // ];
  //    print(weatherForText.toString());
  //    l = findWeather(weatherForText);


      String weatherForText2 = data[4][date].toString();
      q = wwoToText(weatherForText2).toString();

      t = 'Temperature: ${data[2][date].toString()}°C';

      r = 'Rainfall per mm: ${data[1][date].toString()}';

      w_s = 'Wind Speed km/h: ${data[3][date].toString()}';
      // [4][8]

      i = "lib/assets/wwo_images/wwo_${data[4][date]}.png";

    List variables = [i,l,q,r,t,w_s];


    return variables;

  }


}