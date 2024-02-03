/*
import '../demo_imports.dart';

//------------------------------------------------------------------------------
// This screen lists data obtained from the DemoDataApiService
//------------------------------------------------------------------------------

class DemoApiListScreen extends StatefulWidget {
  const DemoApiListScreen({super.key});

  @override
  State<DemoApiListScreen> createState() => _DemoApiListScreenState();
}

class _DemoApiListScreenState extends State<DemoApiListScreen> {
  // Get data from API using the demo_Data_api_service.dart
  //----------------------------------------------------------------------------

  List weatherData = [];
  String response = "";

  getWeatherData() async {
    var data = await DemoDataApiService().fetchWeatherData(
        latitude: 52.52,
        longitude: 14.41,
        timezone: 'Africa/Cairo',
        pastDays: 0,
        forecastDays: 7);
    weatherData = data;
    setState(() {});
  }

  // Convert seconds to hours and minutes
  //----------------------------------------------------------------------------

  String convertSecondsToHoursMinutes(int totalSeconds) {
    int hours =
        totalSeconds ~/ 3600; // Divide total seconds by 3600 to get hours
    int remainingSeconds =
        totalSeconds % 3600; // Get the remaining seconds after extracting hours
    int minutes = remainingSeconds ~/
        60; // Divide the remaining seconds by 60 to get minutes

    // Return the result as a string in the format "HH hours MM minutes"
    return '${hours}:${minutes}';
  }

  // Remove split-seconds from the data
  //----------------------------------------------------------------------------

  String removeDecimalAndTwoDigits(String input) {
    int decimalIndex =
        input.indexOf('.'); // Find the index of the decimal point
    if (decimalIndex != -1) {
      // If the decimal point exists, remove it and the two digits following it
      return input.substring(0, decimalIndex);
    }
    return input; // Return the original string if no decimal point is found
  }

  // Run functions when screen is initialized
  //----------------------------------------------------------------------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  // Screen Build Code
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Data Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                leading: Text('Rain/\nMax '),
                title: Text('Details'),
                trailing: Text('Daylight Hours'),
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: weatherData.length, // Length of the data source
                itemBuilder: (context, index) {
                  // Convert each item to a ScreenItem just when it's needed for rendering
                  var item =
                      weatherData[index]; // Covert item from raw list item
                  // ListTile is a default widget in flutter. You can create your own widget for this
                  return ListTile(
                    leading: Column(
                        children: [
                          double.parse(item['rain_sum']
                                      .toString()
                                      .replaceAll(" mm", "")) >
                                  0.0
                              ? ChoiceCard(choice: choices[0])
                              : ChoiceCard(choice: choices[1]),
                          ],

                    ),
                    title: Text(item['date'].toString()),
                    subtitle: Text(item.toString()),
                    trailing: Column(
                      children: [
                        Text(convertSecondsToHoursMinutes(int.parse(
                                removeDecimalAndTwoDigits(item["daylight_duration"]
                                    .toString()
                                    .replaceAll(" s", "")))) +
                            "hrs"),
                        Text(item['temperature_2m_max'].toString()),

                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

*/
