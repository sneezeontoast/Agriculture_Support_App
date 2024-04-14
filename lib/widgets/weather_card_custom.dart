import 'package:agriculture_support_app/services/get_weather_text_service.dart';

import '../imports.dart';

class WeatherCardCustom extends StatefulWidget {

  int day;


  WeatherCardCustom({super.key, required this.day});

  @override
  State<WeatherCardCustom> createState() => _WeatherCardCustomState();
}

class _WeatherCardCustomState extends State<WeatherCardCustom> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        constraints: BoxConstraints(
          minHeight: 20.0,
          
        ),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(GetWeatherTextService().getWeatherText('q', widget.day), style: Theme.of(context).textTheme.bodyLarge,),
            Row(
              children: [
                // holder for img
                Container(
                  width: (MediaQuery.of(context).size.width / 3) - 40,
                  child: Image.asset(GetWeatherTextService().getWeatherText('i', widget.day)),
                  
                ),
                // text detail section
                Container(
                  width: ((MediaQuery.of(context).size.width / 3)*2) - 40,
                  child: Column(
                    children: [
                      FutureBuilder(future: GetWeatherTextService().getWeatherText('r', widget.day), builder: (BuildContext context, AsyncSnapshot<dynamic> weatherDataSnapshot)),
                      Text(GetWeatherTextService().getWeatherText('r', widget.day)),
                      Text(GetWeatherTextService().getWeatherText('w_s', widget.day)),
                      Text(GetWeatherTextService().getWeatherText('t', widget.day))
                    ],
                  ),
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
