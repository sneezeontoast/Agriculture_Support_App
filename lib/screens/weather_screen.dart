import '../imports.dart';
import '../services/get_weather_text_service.dart';


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
        actions: [
          IconButton(
            icon: Icon(Icons.get_app),
            onPressed: () async {
             var data = await GetWeatherTextService().getWeatherText("q",3);
             print("Response: "+data.toString());
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
         //       WeatherCard(max_height: 200, max_width: MediaQuery.of(context).size.width.round() - 16, day: 0),
         //       WeatherCard(max_height: 200, max_width: MediaQuery.of(context).size.width.round() - 16, day: 1),
                const Text("This Week:"),
              ],
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                        height: 50, width: 100,)
           //             child: WeatherCard(max_height: 50, max_width: MediaQuery.of(context).size.width, day: 2)),
         //           WeatherCard(max_height: 100, max_width: 200, day: 3),
         //           WeatherCard(max_height: 200, max_width: 400, day: 4),
         //           WeatherCard(max_height: 200, max_width: 400, day: 5),
         //           WeatherCard(max_height: 200, max_width: 400, day: 6),
         //           WeatherCard(max_height: 200, max_width: 400, day: 7),

                  ],
                ),
          )),



        ],
      ),
    );
  }
}
