import 'package:agriculture_support_app/services/get_weather_text_service.dart';
import 'package:agriculture_support_app/demo_data/demo_weather_data_model.dart';

import '../imports.dart';

class WeatherCardCustom extends StatefulWidget {

  WeatherDataItem weatherItem;


  WeatherCardCustom({super.key, required this.weatherItem});

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
            Text(widget.weatherItem.temperature, style: Theme.of(context).textTheme.bodyLarge,),
      /*      Row(
              children: [
                // holder for imgx
                Container(
                  width: (MediaQuery.of(context).size.width / 3) - 40,
                  child: variables[0][widget.day] == ""?Icon(Icons.cloud):Image.asset(variables[0][widget.day])),

                // text detail section
                Container(
                  width: ((MediaQuery.of(context).size.width / 3)*2) - 40,
                  child: Column(
                    children: [

                      Text(variables[3][widget.day]),
                      Text(variables[5][widget.day]),
                      Text(variables[4][widget.day]),
                //     Text(GetWeatherTextService().getWeatherText('r', widget.day)),

*/

                    ],

    )
      )

    );
  }
}
