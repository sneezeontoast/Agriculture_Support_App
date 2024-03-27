import 'package:agriculture_support_app/services/weather_get_data.dart';
import 'package:flutter/material.dart';
// import '../imports.dart';
import 'package:agriculture_support_app/services/find_weather_from_data.dart';
class GetWeatherText extends StatelessWidget {
  final String long_or_quick_l_or_q;
  final int day;

  const GetWeatherText({super.key, required this.long_or_quick_l_or_q, required this.day});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherData(),
      builder:
          (BuildContext context, AsyncSnapshot<dynamic> weatherDataSnapshot) {
        String text;
        Widget widget;
        int date = 8 + day;
        print("weatherDataSnapshot.data.toString(): " +
            weatherDataSnapshot.data.toString());
        widget = const Text("error, error code 2");
        if (weatherDataSnapshot.connectionState == ConnectionState.done) {
          if (long_or_quick_l_or_q == 'l') {
            List weatherForText = [
              weatherDataSnapshot.data[0][date],
              weatherDataSnapshot.data[1][date],
              weatherDataSnapshot.data[2][date]
            ];
            text = findWeather(weatherForText).toString();
          } else if (long_or_quick_l_or_q == 'q') {
            String weatherForText = weatherDataSnapshot.data[4][date].toString();
            text = wwoToText(weatherForText).toString();

          } else if(long_or_quick_l_or_q == 't') {
            text = 'Temperature: ${weatherDataSnapshot.data[2][date].toString()}°C';
            widget = Text(text.toString(),
                style: Theme.of(context).textTheme.bodySmall);

          } else if (long_or_quick_l_or_q == 'r') {
            text = 'Rainfall per mm: ${weatherDataSnapshot.data[1][date].toString()}';
            widget = Text(text.toString(),
                style: Theme.of(context).textTheme.bodySmall);
          } else if (long_or_quick_l_or_q == 'w_s') {
            text = 'Wind Speed km/h: ${weatherDataSnapshot.data[3][date].toString()}';
            widget = Text(text.toString(),
                style: Theme.of(context).textTheme.bodySmall);
          // [4][8]

          } else if (long_or_quick_l_or_q == 'i') {
              widget = Image.asset("lib/assets/wwo_images/wwo_${weatherDataSnapshot.data[4][date]}.png");

          } else {
            text = "error try reloading if this is your app check the uses of GetWeatherDataType and what long_or_quick_l_or_q is defined as long_or_quick_l_or_q $long_or_quick_l_or_q not found error code 1";
            widget = Text(text.toString(),
                style: Theme.of(context).textTheme.bodySmall);
          }
        }
        else {
          text = 'loading .. ';
          widget = Text(text.toString(),
              style: Theme.of(context).textTheme.bodySmall);
        }

        return widget;
      },
    );
  }
}
