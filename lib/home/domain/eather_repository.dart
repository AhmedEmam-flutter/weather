import 'package:weather/home/data/models/current_weather_model.dart';
import 'package:weather/home/data/models/forecast_weather_model.dart';


abstract class WeatherRepository {
  Future<CurrentWeatherModel> getCurrentWeather(String region);
  Future<ForecastWeatherModel> getForecast(String region);
}
