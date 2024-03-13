import '../imports.dart';

class WeatherCard extends StatefulWidget {
  final List weather;
  const WeatherCard({super.key, required this.weather});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  String weather = 'no weather info';
  @override
  
  Widget build(BuildContext context) {

    if ( widget.weather[0]['weather'].toString() == 'sunny_and_rainy') {
      weather = "Sunny And Rainy";
    } else if ( widget.weather[0]['weather'].toString() == 'rainy') {
      weather = "Rainy";
    } else if ( widget.weather[0]['weather'].toString() == 'sunny_and_cloudy') {
      weather = "Sunny And Cloudy";
    } else if ( widget.weather[0]['weather'].toString() == 'cyclone') {
      weather = "Cyclone";
    } else if ( widget.weather[0]['weather'].toString() == 'rainy_and_cloudy') {
      weather = "Rainy And Cloudy";
    } else if ( widget.weather[0]['weather'].toString() == 'sunny_and_windy') {
      weather = "Sunny And Windy";
    } else if ( widget.weather[0]['weather'].toString() == 'windy') {
      weather = "Windy";
    } else if ( widget.weather[0]['weather'].toString() == 'sunny_and_cloudy') {
      weather = "Sunny And Cloudy";
    }
    return Center(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 200,
      ),
      child: Card(
        margin: const EdgeInsets.all(20),
        color: Colors.lightGreen[300],
        child: Column(
          children: <Widget>[
            // Text("weather: " + widget.weather.toString()),
            Expanded(
                child: ListTile(
              leading:
                  Image.asset("lib/assets/${widget.weather[0]['weather']}.png"),
              // Ink.image(
              //   width: double.infinity,
              //   height: 300,
              //   fit: BoxFit.cover,
              //   image: AssetImage('lib/assets/'+ weather[0]['weather'] + ".png"),
              // ),

              // leading: Image.asset("asset/" + weather[0]['weather'] + ".png"),
              title: Text(weather),
              subtitle: Expanded(
                child: Column(
                  children: [

                    Text("temperature ${widget.weather[1]['temperature']}"),
                    Text(
                        "rainfall over last week ${widget.weather[2]['rainfall']}")
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
