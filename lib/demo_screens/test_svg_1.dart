import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../demo_services/weather_build_svg_graphics.dart';
import '../demo_services/svg_assets/defs.dart';

const String svgPrefix =
    '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 800">''';
const String svgSuffix = '''</svg>''';




void main() async {
  String svgWeatherString = await getSvgString();
  String svgInputString =
      [svgPrefix, svgDefsString, svgWeatherString, svgSuffix].join('\n');

  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Weather Data"),
          ),
          body: Column(children: [
            const Text('14-day Forecast'),
            SvgPicture.string(svgInputString),

            // width: 200,
            // height: 200
          ]),

          // Container(
          //   padding: const EdgeInsets.all(20.0),
          //   child: const Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('First child'),
          //       Text('Second child'),
          //     ],
          //   ),
          ),
    ),
  );
}

class WeatherAppI extends StatelessWidget {
  const WeatherAppI({super.key});
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Weather App';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
