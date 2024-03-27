import '../imports.dart';
import 'weather_get_data.dart';
import 'find_weather_from_data.dart';

class GetWeatherTextService {

  getWeatherText(String datatype,int day) async {
    print("Starting...");
    int date = 8 + day;
    String text = "";
    var data = await getWeatherData();
    print("Data: "+data.toString());
    if (datatype == 'l') {
      List weatherForText = [
        data[0][date],
        data[1][date],
        data[2][date]
      ];
      text = findWeather(weatherForText).toString();
    } else if (datatype == 'q') {
      String weatherForText = data[4][date].toString();
      text = wwoToText(weatherForText).toString();

    } else if(datatype == 't') {
      text = 'Temperature: ${data[2][date].toString()}°C';

    } else if (datatype == 'r') {
      text = 'Rainfall per mm: ${data[1][date].toString()}';

    } else if (datatype == 'w_s') {
      text = 'Wind Speed km/h: ${data[3][date].toString()}';
      // [4][8]

    } else if (datatype == 'i') {
      text = "lib/assets/wwo_images/wwo_${data[4][date]}.png";

    } else {
      text = "error try reloading if this is your app check the uses of GetWeatherDataType and what long_or_quick_l_or_q is defined as long_or_quick_l_or_q $datatype not found error code 1";
    }
    return text;

  }


}