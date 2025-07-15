class ForecastDay {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;

  ForecastDay({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      minTemp: json['day']['mintemp_c'].toDouble(),
      condition: json['day']['condition']['text'],
    );
  }
}

class ForecastWeatherModel {
  final List<ForecastDay> days;

  ForecastWeatherModel({required this.days});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    final daysList = (json['forecast']['forecastday'] as List)
        .map((day) => ForecastDay.fromJson(day))
        .toList();

    return ForecastWeatherModel(days: daysList);
  }
}
