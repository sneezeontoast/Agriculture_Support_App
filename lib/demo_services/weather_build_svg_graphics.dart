import '../demo_imports.dart';
import 'weather_get_data.dart';
import 'dart:developer';
import 'dart:ui';

//import 'dart:html';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

// ---- Get System Dimension ----


Map<String, dynamic> currentData = {};
const int paddingLeftGraph = 60;
const int heightMultiplier = 12;
const int labelStepsY = 5;
const int stepMultiplier = 35;
const int containerHeight = 200;
const int containerWidth = 1000;

const int LabelStepsY = 5;

Future<String> getSvgString() async {
  List weatherData = await getWeatherDataD();
  List<String> dates = weatherData[0];
  List<double> tempsMax = weatherData[1];
  List<double> tempsMin = weatherData[2];
  List<double> tempsAvg = weatherData[3];

  String drawData() {
    String getPolyPositions(List<dynamic> parameter, String reversed) {
      String positions = '';
      int x, y;
      int index = 0;
      List<dynamic> items = parameter;
      for (var item in items) {
        x = (index * stepMultiplier + paddingLeftGraph).round();
        y = (containerHeight - item * heightMultiplier).round();
        positions += ' ${x},${y}';
        index++;
      }
      if (reversed == "reverse") {
        //print(positions);
        positions = positions.split(" ").reversed.join(' ');
        //print(reversed);
        //print(positions);
      }
      //print(positions);
      return positions;
    }

    String drawSvgPoly(positions, clrgradient, ptype) {
      String polyBase = '';
      if (ptype == 'drop') {
        polyBase =
            '<polygon fill="url(#clrgradient)" points="$paddingLeftGraph, $containerHeight INSERT_POINTS $containerWidth + $paddingLeftGraph},$containerHeight"></polygon>';
      } else if (ptype == 'poly') {
        polyBase =
            '<polygon fill="url(#clrgradient)" points="INSERT_POINTS"></polygon>';
      } else if (ptype == 'line') {
        polyBase =
            '<polyline points="INSERT_POINTS" style="fill:none;stroke:green;stroke-width:3" />';
      } else {
        polyBase = '';
      }
      String poly = polyBase
          .replaceAll('INSERT_POINTS', positions)
          .replaceAll('clrgradient', clrgradient);
      //String poly = poly_base.replaceAll('INSERT_POINTS', positions).replaceAll('"url(#clrgradient)"', 'red');
      //print(poly);

      return poly;
    }

    String polyTempsAvg =
        drawSvgPoly(getPolyPositions(tempsAvg, ''), 'gradient1', 'line');

    //print('--- COMBINED ---');
    String polyPos = '${getPolyPositions(tempsMax, '')}\n${getPolyPositions(tempsAvg, 'reverse')}';
    String polyTempsMax = drawSvgPoly(polyPos, 'gradient4', 'poly');
    polyPos = '${getPolyPositions(tempsMin, '')}\n${getPolyPositions(tempsAvg, 'reverse')}';
    String polyTempsMin = drawSvgPoly(polyPos, 'gradient5', 'poly');

    String svgPoly = [polyTempsMax, polyTempsMin, polyTempsAvg].join('\n');
    return svgPoly;
  }

  String getWeekDay(dayNumber) {
    //let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    List days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    //let days = ["S", "M", "T", "W", "T", "F", "S"];
    return days[dayNumber - 1];
  }

  String drawLables() {
    //const dates = currentData.daily.time
    //let d = new Date()
    const int daysForecast = 7;
    const int daysHistory = 14;

    //const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    const weekday = ["S", "M", "T", "W", "T", "F", "S"];

    String verticalLinesString = '';
    String verticalLabelString = '';

    for (var index = 0; index < 50; index += LabelStepsY) {
      var height = containerHeight - index * heightMultiplier;
      var dayOffset = 0;

      verticalLinesString =
          '$verticalLinesString<line x1="0" y1="$height" x2="1000" y2="$height" style="stroke:rgb(90,90,90);stroke-width:2" />\n';
      verticalLabelString =
          '$verticalLabelString<text x="0" y="$height" fill="black">$index °C</text>\n';
    }

    String divideString = '';
    //divideHistoryForecastString = divideHistoryForecastString + '<line x1="0" y1="$containerHeight" x2="1000" y2="$containerHeight" stroke="red" stroke-width="8" />'
    //divideHistoryForecastString = divideHistoryForecastString + `<line x1="0" y1="0" x2="1000" y2="0" class="line" stroke="red" stroke-width="8" />`
    //divideHistoryForecastString = divideHistoryForecastString + `<line x1="0" y1="0" x2="0" y2="${container_height}" class="line" stroke="red" stroke-width="8" />`
    //divideHistoryForecastString = divideHistoryForecastString + `<line x1="800" y1="0" x2="800" y2="${container_height}" class="line" stroke="red" stroke-width="8" />`
    //console.log(verticalLinesString)
    //print(currentData);

    String horizontalLinesString = '';
    String horizontalLabelString = '';
    String dayText;
    var dayDivide = 7;
    var dayIndex = 0;
    for (var date in dates) {
      dayIndex += 1;
      var dt = DateTime.parse(date);
      //print([dt.day, dt.month].join('\t'));
      //print(dt.weekday);
      //print(getWeekDay(dt.weekday));
      dayText = getWeekDay(dt.weekday);
      if (dt == DateTime.now()) {
        dayText = 'Today';
      }
      var width = dayIndex * stepMultiplier + paddingLeftGraph;
      log("$width");
      if (dayIndex == dayDivide) {
        divideString =
            '$divideString<line x1="$width" y1="50" x2="$width" y2="1020" class="line"  style="stroke:#4C5C5B; stroke-width:10" />';
        divideString =
            '$divideString<text x="$width - 72" y="70" >Historic -|- Forecast</text>';
      }

      horizontalLinesString =
          '$horizontalLinesString<line x1="$width" y1="50" x2="$width" y2="200" style="stroke:#4C5C5B; stroke-width:2"/>\n';
      //horizontalLabelString = horizontalLabelString + '<text x="${width}" y="${container_height - 5}" fill="white">${daytext}</text>';
      horizontalLabelString =
          '$horizontalLabelString<text x="$width" y="${containerHeight - 5}" fill="blue">$dayText</text>\n';

    }
    log(horizontalLinesString);
    log(horizontalLabelString);
    //var date = new DateTime.now();
    //print('Today date');
    //print(date);
    //var dayIndex = 0;
    //const int dayDivide = 7;
    /*
    for (int index = 0; index < 21; index += 1) {

      String dayText = '';
      dayText = getWeekDay(date);
      print(index, dayText);
      /*
      if (dayIndex == dayDivide) {
        dayText = getWeekDay(date); // 'Today'
        //console.log('+++++++++++++++++++++++++++++=')
        //console.log(date)
      } else if (dayIndex == dayDivide + 1) {
        dayText = getWeekDay(date); //'Tomorrow'
      } else {
        var date = new DateTime.now();
        date.setDate(date.getDate() + dayIndex);
        dayText = getWeekDay(date);
    }

      var d = new DateTime(dates[index]); //.getDay()
      dayText = weekday[d.getDay()];
      //print('date:', index, d, dates[index], daytext);
      var width = index * stepMultiplier + paddingLeftGraph;

      if (dayIndex == dayDivide) {
        divideString = divideString + '<line x1="${width}" y1="50" x2="${width}" y2="1020" class="line"  style="stroke:#4C5C5B; stroke-width:10" />';
        divideString = divideString + '<text x="${width - 72}" y="70" >Historic -|- Forecast</text>';
    */
    //divideString = divideString + `<rect x="50" y="50" width="200" height="950" style="fill:blue; stroke-width:3; stroke:rgb(0,200,0)"`
    //divideString = divideString + `<rect x="${width}" y="50" width="400" height="950" style="fill:grey; stroke-width:3; stroke:rgb(200,0,0)"`
    //divideString = divideString + `<text x="${width - 80}" y="${50}">Historic</text>`
    //divideString = divideString + `<text x="${width + 20}" y="${50}">Forecast</text>`
    }


    horizontalLinesString = horizontalLinesString + '<line x1="${width}" y1="50" x2="${width}" y2="1000" class="line"/>';
    //horizontalLabelString = horizontalLabelString + '<text x="${width}" y="${container_height - 5}" fill="white">${daytext}</text>';
    horizontalLabelString = horizontalLabelString + '<text x="${width}" y="${containerHeight - 5}" fill="white">${daytext}</text>';


    dayIndex = dayIndex + 1;
    //console.log(index, dayIndex)
    }
    */
    String allPlotString = verticalLinesString + verticalLabelString +
        horizontalLinesString + horizontalLabelString;
    //divideString +
    //horizontalLinesString +
    //horizontalLabelString;
    log(allPlotString);
    return allPlotString;
  }

//print(weatherData);
  String svgDataString = drawData();
  //log(svgDataString);
  String svgLabelString = drawLables();
  //log('_____________________________________');
  //log(svgLabelString);
  String svgString = [svgDataString, svgLabelString].join('\n');
  //log(svgString);
  return svgString;
}
