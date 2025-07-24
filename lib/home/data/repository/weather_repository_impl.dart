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

  Future<String> getAiPrediction(CurrentWeatherModel weather) async {
    List<int> inputList = _convertWeatherToAiInput(weather);
    return await apiService.sendWeatherToAiModel(inputList);
  }

 List<int> _convertWeatherToAiInput(CurrentWeatherModel weather) {
  String condition = weather.condition.toLowerCase();
  int outlookRainy = condition.contains('rain') ? 1 : 0;
  int outlookSunny = condition.contains('sun') || condition.contains('clear') ? 1 : 0;
  int tempHot = weather.temperature >= 30.0 ? 1 : 0;
  int tempMild = (weather.temperature >= 20.0 && weather.temperature < 30.0) ? 1 : 0;
  int humidityNormal = weather.humidity >= 40 && weather.humidity <= 60 ? 1 : 0;

  return [outlookRainy, outlookSunny, tempHot, tempMild, humidityNormal];
}
}