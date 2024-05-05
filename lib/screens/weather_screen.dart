import 'package:agriculture_support_app/demo_data/demo_weather_data_model.dart';
import 'package:agriculture_support_app/services/get_weather_text_service.dart';
import 'package:agriculture_support_app/widgets/weather_card_custom.dart';

import '../imports.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  List<WeatherDataItem> weatherData = [];

  setData() async {
    weatherData = await GetWeatherTextService().getWeatherText(0,7);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Column(
        children: [
          Expanded(child:
            ListView.builder(
                itemCount: weatherData.length,
                itemBuilder: (context, index) {
                  return WeatherCardCustom(
                    weatherItem: weatherData[index],
                  );
                })
          ),




            ],
      )
    );
  }
}
