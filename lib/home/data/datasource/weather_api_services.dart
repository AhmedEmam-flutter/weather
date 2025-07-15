import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/home/data/models/current_weather_model.dart';
import 'package:weather/home/data/models/forecast_weather_model.dart';

class WeatherApiService {
  final String apiKey = '382558a54c894aa0b41192814251207';

  Future<CurrentWeatherModel> fetchCurrentWeather(String region) async {
    final url =
        'https://api.weatherapi.com/v1/current.json?q=$region&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CurrentWeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  Future<ForecastWeatherModel> fetchForecast(String region) async {
    final url =
        'https://api.weatherapi.com/v1/forecast.json?q=$region&days=3&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ForecastWeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load forecast');
    }
  }
}
