import '../imports.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});
  var long_description = findWeather([100, 100, 100, 100]);
  List weather_today = [
    {'long_description': findWeather([100, 100, 100, 100]).toString()},
    {'weather': 'sunny_and_cloudy'},
    {'temperature': '37'},
    {'rainfall': '5'}
  ];

  List weather_tommorow = [
    {'long_description': findWeather([100, 100, 100, 100]).toString()},
    {'weather': 'sunny_and_rainy'},
    {'temperature': '37'},
    {'rainfall': '5'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: Column(
        children: <Widget>[
          Text("Today"),
          WeatherCard(
            weather: weather_today,
          ),
          Text("Tommorow"),
          WeatherCard(weather: weather_tommorow)
        ],
      ),
    );
  }
}
