class CurrentWeatherModel {
  final String region;
  final double temperature;
  final String condition;

  CurrentWeatherModel({
    required this.region,
    required this.temperature,
    required this.condition,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      region: json['location']['name'],
      temperature: json['current']['temp_c'].toDouble(),
      condition: json['current']['condition']['text'],
    );
  }
}
