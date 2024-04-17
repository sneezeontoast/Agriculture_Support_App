class WeatherDataItem {
  final String longDesc;
  final String quickDesc;
  final String rainfall;
  final String temperature;
  final String windSpeed;
  final String imageNo;

  WeatherDataItem({required this.longDesc, required this.quickDesc, required this.rainfall, required this.temperature, required this.windSpeed, required this.imageNo});

  factory WeatherDataItem.fromJson(Map<String, dynamic> json) {
    return WeatherDataItem(
      longDesc: json['longDesc'] ?? '',
      quickDesc: json['quickDesc'] ?? '',
      rainfall: json['rainfall'] ?? '',
      temperature: json['temperature'] ?? '',
      windSpeed: json['windSpeed'] ?? '',
      imageNo: json['imageNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'longDesc': longDesc,
      'quickDesc': quickDesc,
      'rainfall': rainfall,
      'temperature': temperature,
      'windSpeed': windSpeed,
      'imageNo': imageNo,
    };
  }
}
