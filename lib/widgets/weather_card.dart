import '../imports.dart';

class WeatherCard extends StatefulWidget {
  final int max_height;
  final int max_width;

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
          constraints: const BoxConstraints(
            maxHeight: 200,
            maxWidth: 400,

          ),
          child: Card(
            margin: const EdgeInsets.all(20),
            color: Colors.lightGreen[300],
            child: Column(
              children: <Widget>[
                // Text("weather: " + widget.weather.toString()),
                Expanded(
                    child: ListTile(
                      leading: GetWeatherText(long_or_quick_l_or_q: 'i', day: widget.day),
                      // GetWeatherText(long_or_quick_l_or_q: 'i', day: widget.weather[5]['day'],),
                      // Ink.image(
                      //   width: double.infinity,
                      //   height: 300,
                      //   fit: BoxFit.cover,
                      //   image: AssetImage('lib/assets/'+ weather[0]['weather'] + ".png"),
                      // ),

                      // leading: Image.asset("asset/" + weather[0]['weather'] + ".png"),
                      title: GetWeatherText(long_or_quick_l_or_q: 'q', day: widget.day),
                      subtitle: Expanded(
                          child: Center(
                            child: Column(
                              children: [

                                GetWeatherText(long_or_quick_l_or_q: 't', day: widget.day),
                                GetWeatherText(long_or_quick_l_or_q: 'r', day: widget.day),
                                GetWeatherText(long_or_quick_l_or_q: 'w_s', day: widget.day),




                              ],
                            ),
                          )

                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

/*
// problem because no size ?
import '../imports.dart';

const days = {
  1: 'Monday ',
  2: 'Tuesday ',
  3: 'Wednesday ',
  4: 'Thursday ',
  5: 'Friday ',
  6: 'Saturday',
  7: 'Sunday '
};
// String getDateAndDayAfter(int duration) {
//   DateTime now = DateTime.now();
//   DateTime futureDate = now.add(Duration(days: duration));
//   String formattedDate = "${futureDate.day}/${futureDate.month}/${futureDate.year}";
//   String formattedDay = days[futureDate.weekday] ?? "nothing found error 0";
//   return "$formattedDay $formattedDate";
// }
class WeatherCard extends StatefulWidget {
  final int max_height;
  final int max_width;
  // final String day_text;

  final int day;


  const WeatherCard({super.key, required this.max_height, required this.max_width, required this.day, });

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
      constraints: const BoxConstraints(
        maxHeight: 200,
        maxWidth: 400,

      ),
      child: Column(
        children: [
          // if (widget.weather != null)
          //   Access widget.weather properties here
          // else
            // Handle the case where widget.weather is null

          // Text(getDateAndDayAfter(widget.day)),
          // Text(widget.day_text),
          Card(
            margin: const EdgeInsets.all(20),
            color: Colors.lightGreen[300],
            child: Column(
              children: <Widget>[
                // Text("weather: " + widget.weather.toString()),
                Expanded(
                    child:
                    ListTile(
                      leading: GetWeatherText(long_or_quick_l_or_q: 'i', day: widget.day),
                      // GetWeatherText(long_or_quick_l_or_q: 'i', day: widget.weather[5]['day'],),
                      // Ink.image(
                      //   width: double.infinity,
                      //   height: 300,
                      //   fit: BoxFit.cover,
                      //   image: AssetImage('lib/assets/'+ weather[0]['weather'] + ".png"),
                      // ),

                      // leading: Image.asset("asset/" + weather[0]['weather'] + ".png"),
                      title: GetWeatherText(long_or_quick_l_or_q: 'q', day: widget.day),
                      subtitle: Center(
                            child: Column(
                              children: [

                                GetWeatherText(long_or_quick_l_or_q: 't', day: widget.day),
                                GetWeatherText(long_or_quick_l_or_q: 'r', day: widget.day),
                                GetWeatherText(long_or_quick_l_or_q: 'w_s', day: widget.day),




                              ],
                            ),
                          )

                      ),
                    ),
              ],
            ),
          ),
        ],
      )
    ));
  }
}

 */
