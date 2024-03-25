import '../imports.dart';


const rain = {
  0: 0,
  200: 15,
  400: 30,
  600: 45,
  800: 60,
  1000: 75,
  1200: 100
};

const flutterCloud = {
  0: 0,
  15: 15,
  30: 30,
  45: 45,
  60: 60,
  75: 75,
  100: 100,
};

const sun = {
  0: 0,
  15: 15,
  30: 30,
  45: 45,
  60: 60,
  75: 75,
  100: 100
};

const wind = {
  0: 0,
  15: 15,
  30: 30,
  45: 45,
  60: 60,
  75: 75,
  100: 100

};

const good_bad_thresholds = {
  0: 'no ',
  25: 'low ',
  50: 'moderate ',
  75: 'high ',
  100: 'very high '
};


const weather_text_convert = {
  0: 'rainy ',
  1: 'cloudy ',
  2: 'hot ',
  3: 'windy '
};






const weather_intensity_convert = {
  0: 'not ',
  25: 'slightly ',
  50: 'moderately ',
  75: 'quite ',
  100: 'really ',
};

const other_good_bad_thresholds = {
  0: 'not ',
  25: 'slightly ',
  50: 'moderately ',
  75: 'quite ',
  100: 'really '
};

const wwo_variables = {
  0: 'Clear Sky ',
  1: 'Mainly Clear ',
  2: 'Partly Cloudy ',
  3: 'cloud overcast ',
  45: 'Fog ',
  48: 'depositing rime fog ',
  51: 'Light Drizzle ',
  53: 'Moderate Drizzle ',
  55: 'Intense Drizzle ',
  56: 'Light Freezing Drizzle ',
  57: 'Intense freezing rainfall ',
  61: 'Slight Rain ',
  63: 'Moderate Rain ',
  65: 'Heavy Rain ',
  66: 'Light Freezing Rain ',
  67: 'Intense Freezing Rain',
  71: 'Slight Snow ',
  73: 'Moderate Snow Fall ',
  75: 'Heavy Snow Fall ',
  77: 'Snow Grains ',
  80: 'Slight Rain Showers ',
  81: 'Moderate Rain Showers ',
  82: 'Violent Rain Showers ',
  85: 'Slight Snow Showers ',
  86: 'Heavy Snow Showers ',
  95: 'Thunderstorm ',
  96: 'Thunderstorm with slight hail ',
  99: 'Thunderstorm with heavy hail ',




};

String findGoodOrBad(int percent, dictionary) {

  List<int> lst = other_good_bad_thresholds.keys.toList();

  // Find the closest percentage value in lst to the input percent
  int closestPercent = lst.reduce((a, b) => (a - percent).abs() < (b - percent).abs() ? a : b);

  // Get the intensity level based on the closest percentage
  // String intensity = weather_intensity_convert[closestPercent] ?? "";

  // Get the weather description based on the closest percentage
  String weatherText = dictionary[closestPercent] ?? "nothing found error 0";

  // Combine intensity and weather description
  return weatherText;
}

String findNearestValue(value, data) {
  var values = data.where((x) => x <= value).map((x) => x).toList();
  var nearest_value = values.sort();
  return data[nearest_value.last];

}

String wwoToText(wwo) {
  int wwoInt = int.parse(wwo);
  String wwoText = wwo_variables[wwoInt] ?? "nothing found error 0 wwoInt = $wwoInt wwo runtimeType + ${wwoInt.runtimeType}";
  return wwoText;


}

String findWeatherC(weather_mesurement) {
  var weathers = [['rainfall ', weather_mesurement[0]], ['cloud cover ', weather_mesurement[1]], ['temperature ', weather_mesurement[2]], ['wind speed ', weather_mesurement[3]]];

  var top_weather = 'no weather info';
  var weather_text = 'nothing';
  var top_weather_value = 0;
  bool dose_not_work = true;
  int thresh = 90;
  // var rainy = ('rainy ', weather_mesurement[0]);
  // var cloudy = ('cloudy ', weather_mesurement[1]);
  // var sunny = ('sunny ', weather_mesurement[2]);
  // var windy = ('windy ', weather_mesurement[3]);
  List rainy = ['rainy ', weather_mesurement[0]];
  List cloudy = ['cloudy ', weather_mesurement[1]];
  List sunny = ['sunny ', weather_mesurement[2]];
  List windy = ['windy ', weather_mesurement[3]];
  List best_weathers = [rainy, cloudy];

  List range_3 = [0, 1, 2];
  while(dose_not_work) {
    for(int i in range_3) {
      weather_text = weather_text_convert[i] ?? "nothing found error 0";
      if(weather_mesurement[i] >= thresh && weather_mesurement[i] >= top_weather_value) {
        top_weather_value = weather_mesurement[i];
        top_weather = weather_text;
      }
    }

    if( weather_mesurement[0] + weather_mesurement[1] >= thresh ) {
      best_weathers = [rainy, cloudy];
      dose_not_work = false;
    }
    if( weather_mesurement[0] + weather_mesurement[2] >= thresh ) {
      best_weathers = [rainy, sunny];
      dose_not_work = false;
    }
    if( weather_mesurement[0] + weather_mesurement[3] >= thresh ) {
      best_weathers = [rainy, windy];
      dose_not_work = false;
    }
    if( weather_mesurement[1] + weather_mesurement[2] >= thresh ) {
      best_weathers = [cloudy, sunny];
      dose_not_work = false;
    }
    if( weather_mesurement[1] + weather_mesurement[3] >= thresh ) {
      best_weathers = [cloudy, windy];
      dose_not_work = false;
    }
    if( weather_mesurement[2] + weather_mesurement[3] >= thresh ) {
      best_weathers = [sunny, windy];
      dose_not_work = false;
    }
    thresh -= 10;
  }
  var quick_description = findGoodOrBad(best_weathers[0][1], other_good_bad_thresholds) +
      best_weathers[0][0] +
      " and " +
      findGoodOrBad(best_weathers[1][1], other_good_bad_thresholds) +
      best_weathers[1][0];
  var long_description = (findGoodOrBad(weathers[0][1], good_bad_thresholds) +
      weathers[0][0] +
      "with " +
      findGoodOrBad(weathers[1][1], good_bad_thresholds) +
      weathers[1][0] + "and " +
      findGoodOrBad(weathers[2][1], good_bad_thresholds)
      + weathers[2][0]
  );
  // var quick_description = findGoodOrBad(best_weathers.item2.item2, other_good_bad_thresholds) +
  //     best_weathers.item2.item1 +
  //     "and " +
  //     findGoodOrBad(best_weathers.item3.item2, other_good_bad_thresholds) +
  //     best_weathers.item3.item1;
  return long_description;
}
 // https://api.open-meteo.com/v1/forecast?latitude=15.88&longitude=35&hourly=temperature_2m,relative_humidity_2m,dew_point_2m,apparent_temperature,precipitation_probability,rain,cloud_cover,wind_speed_10m,soil_moisture_9_to_27cm&daily=rain_sum&timezone=Africa%2FCairo

String findWeather(weather_mesurement) {
  var weathers = [['rainfall ', weather_mesurement[0]], ['temperature ', weather_mesurement[2]], ['wind speed ', weather_mesurement[3]]];

  var top_weather = 'no weather info';
  var weather_text = 'nothing';
  var top_weather_value = 0;
  bool dose_not_work = true;
  int thresh = 90;
  // var rainy = ('rainy ', weather_mesurement[0]);
  // var cloudy = ('cloudy ', weather_mesurement[1]);
  // var sunny = ('sunny ', weather_mesurement[2]);
  // var windy = ('windy ', weather_mesurement[3]);
  List rainy = ['rainy ', weather_mesurement[0]];
  List cloudy = ['cloudy ', weather_mesurement[1]];
  List sunny = ['sunny ', weather_mesurement[2]];
  List windy = ['windy ', weather_mesurement[3]];
  List best_weathers = [rainy, cloudy];

  List range_3 = [0, 1, 2];
  while(dose_not_work) {
    for(int i in range_3) {
      weather_text = weather_text_convert[i] ?? "nothing found error 0";
      if(weather_mesurement[i] >= thresh && weather_mesurement[i] >= top_weather_value) {
        top_weather_value = weather_mesurement[i];
        top_weather = weather_text;
      }
    }

    // if( weather_mesurement[0] + weather_mesurement[1] >= thresh ) {
    //   best_weathers = [rainy, cloudy];
    //   dose_not_work = false;
    // }
    if( weather_mesurement[0] + weather_mesurement[1] >= thresh ) {
      best_weathers = [rainy, sunny];
      dose_not_work = false;
    }
    if( weather_mesurement[0] + weather_mesurement[2] >= thresh ) {
      best_weathers = [rainy, windy];
      dose_not_work = false;
    }
    /*
    if( weather_mesurement[1] + weather_mesurement[2] >= thresh ) {
      best_weathers = [cloudy, sunny];
      dose_not_work = false;
    }
    if( weather_mesurement[1] + weather_mesurement[3] >= thresh ) {
      best_weathers = [cloudy, windy];
      dose_not_work = false;
    }

     */
    if( weather_mesurement[1] + weather_mesurement[2] >= thresh ) {
      best_weathers = [sunny, windy];
      dose_not_work = false;
    }
    thresh -= 10;
  }
  var quick_description = findGoodOrBad(best_weathers[0][1], other_good_bad_thresholds) +
      best_weathers[0][0] +
      " and " +
      findGoodOrBad(best_weathers[1][1], other_good_bad_thresholds) +
      best_weathers[1][0];
  var long_description = (findGoodOrBad(weathers[0][1], good_bad_thresholds) +
      weathers[0][0] +
      "with " +
      findGoodOrBad(weathers[1][1], good_bad_thresholds) +
      weathers[1][0] + "and " +
      findGoodOrBad(weathers[2][1], good_bad_thresholds)
      + weathers[2][0]
  );
  // var quick_description = findGoodOrBad(best_weathers.item2.item2, other_good_bad_thresholds) +
  //     best_weathers.item2.item1 +
  //     "and " +
  //     findGoodOrBad(best_weathers.item3.item2, other_good_bad_thresholds) +
  //     best_weathers.item3.item1;
  return long_description;
}
