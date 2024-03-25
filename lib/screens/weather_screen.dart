import '../imports.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var long_description = findWeather([100, 100, 100, 100]);
  List weather_today = [
    {'day': 0},
    {'max_height': 200},
    {'max_width': 400}

  ];

  List weather_tommorow = [
    {'day': 1},
    {'max_height': 200},
    {'max_width': 400}

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Text("Today"),
                WeatherCard(max_height: 200, max_width: MediaQuery.of(context).size.width.round() - 16, day: 0),
                Text("Tommorow"),
                WeatherCard(max_height: 200, max_width: MediaQuery.of(context).size.width.round() - 16, day: 1),
                Text("this week"),
              ],
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    WeatherCard(max_height: 50, max_width: 100, day: 2),
                    WeatherCard(max_height: 100, max_width: 200, day: 3),
                    WeatherCard(max_height: 200, max_width: 400, day: 4),
                    WeatherCard(max_height: 200, max_width: 400, day: 5),
                    WeatherCard(max_height: 200, max_width: 400, day: 6),
                    WeatherCard(max_height: 200, max_width: 400, day: 7),

                  ],
                ),
          )),



        ],
      ),
    );
  }
}
