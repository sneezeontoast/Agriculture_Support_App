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
    {'max_width': 400},
    {'day_text': 'Tommorow'}

  ];

  List weather_tommorow = [
    {'day': 1},
    {'max_height': 200},
    {'max_width': 400},
    {'day_text': 'Tommorow'}

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                WeatherCardCustom(image:"lib/assets/wwo_73.png",title: 'Snowy Weather',),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WeatherCardCustom(image: 'lib/assets/wwo_77.png', title: 'freezing frost',),
                ),
                // WeatherCard(max_height: 200, max_width: MediaQuery.of(context).size.width.round() - 16, day: 0),
                // WeatherCard(max_height: 200, max_width: MediaQuery.of(context).size.width.round() - 16, day: 1),
                // const Text("This Week:"),
              ],
            ),
          ),
          const SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // WeatherCard(max_height: 50, max_width: 100, day: 2),
                    // WeatherCard(max_height: 100, max_width: 200, day: 3),
                    // WeatherCard(max_height: 200, max_width: 400, day: 4),
                    // WeatherCard(max_height: 200, max_width: 400, day: 5),
                    // WeatherCard(max_height: 200, max_width: 400, day: 6),
                    // WeatherCard(max_height: 200, max_width: 400, day: 7),

                  ],
                ),
          )),



        ],
      ),
    );
  }
}
