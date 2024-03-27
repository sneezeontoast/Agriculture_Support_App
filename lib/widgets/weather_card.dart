import '../imports.dart';

class WeatherCard extends StatefulWidget {
  final double max_height;
  final double max_width;

  final int day;


  const WeatherCard({super.key, required this.max_height, required this.max_width, required this.day});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  String weather = 'no weather info';
  @override

  Widget build(BuildContext context) {
/*
    if ( widget.weather[1]['weather'].toString() == 'sunny_and_rainy') {
      weather = "Sunny And Rainy";
    } else if ( widget.weather[1]['weather'].toString() == 'rainy') {
      weather = "Rainy";
    } else if ( widget.weather[1]['weather'].toString() == 'sunny_and_cloudy') {
      weather = "Sunny And Cloudy";
    } else if ( widget.weather[1]['weather'].toString() == 'cyclone') {
      weather = "Cyclone";
    } else if ( widget.weather[1]['weather'].toString() == 'rainy_and_cloudy') {
      weather = "Rainy And Cloudy";
    } else if ( widget.weather[1]['weather'].toString() == 'sunny_and_windy') {
      weather = "Sunny And Windy";
    } else if ( widget.weather[1]['weather'].toString() == 'windy') {
      weather = "Windy";
    } else if ( widget.weather[1]['weather'].toString() == 'sunny_and_cloudy') {
      weather = "Sunny And Cloudy";
    }

 */
    return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: widget.max_width,
            maxWidth: widget.max_height,

          ),
          child: Card(
            margin: const EdgeInsets.all(20),
            color: Colors.lightGreen[300],
            child: Column(
              children: <Widget>[
                // Text("weather: " + widget.weather.toString()),
                Expanded(
                    child: ListTile(
                      leading: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 60
                          ),
                          child: GetWeatherText(long_or_quick_l_or_q: 'i', day: widget.day)),
                      // GetWeatherText(long_or_quick_l_or_q: 'i', day: widget.weather[5]['day'],),
                      // Ink.image(
                      //   width: double.infinity,
                      //   height: 300,
                      //   fit: BoxFit.cover,
                      //   image: AssetImage('lib/assets/'+ weather[0]['weather'] + ".png"),
                      // ),

                      // leading: Image.asset("asset/" + weather[0]['weather'] + ".png"),
                      title: GetWeatherText(long_or_quick_l_or_q: 'q', day: widget.day),
                      subtitle:  Center(
                            child: Column(
                              children: [

                                GetWeatherText(long_or_quick_l_or_q: 't', day: widget.day),
                                GetWeatherText(long_or_quick_l_or_q: 'r', day: widget.day),
                                GetWeatherText(long_or_quick_l_or_q: 'w_s', day: widget.day),

                              ],
                            ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
