import 'package:agriculture_support_app/services/get_weather_text_service.dart';

import '../imports.dart';

class WeatherCardCustom extends StatefulWidget {

  int day;


  WeatherCardCustom({super.key, required this.day});

  @override
  State<WeatherCardCustom> createState() => _WeatherCardCustomState();
}

class _WeatherCardCustomState extends State<WeatherCardCustom> {

//  List variables = [i,l,q,r,t,w_s];
 List variables = ["","","","","",""];


  setData() async {
    variables = await GetWeatherTextService().getWeatherText(widget.day);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }




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
            Text(variables[2], style: Theme.of(context).textTheme.bodyLarge,),
            Row(
              children: [
                // holder for imgx
                Container(
                  width: (MediaQuery.of(context).size.width / 3) - 40,
                  child: variables[0] == ""?Icon(Icons.cloud):Image.asset(variables[0])),

                // text detail section
                Container(
                  width: ((MediaQuery.of(context).size.width / 3)*2) - 40,
                  child: Column(
                    children: [
                      Text(variables[3]),
                      Text(variables[5]),
                      Text(variables[4]),
                //     Text(GetWeatherTextService().getWeatherText('r', widget.day)),
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
