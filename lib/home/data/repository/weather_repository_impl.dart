import 'package:weather/home/data/datasource/weather_api_services.dart';
import 'package:weather/home/data/models/current_weather_model.dart';
import 'package:weather/home/data/models/forecast_weather_model.dart';
import 'package:weather/home/domain/eather_repository.dart';


class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String region) {
    return apiService.fetchCurrentWeather(region);
  }

  @override
  Future<ForecastWeatherModel> getForecast(String region) {
    return apiService.fetchForecast(region);
  }
}
