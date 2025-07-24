import 'package:weather/home/data/models/current_weather_model.dart';
import 'package:weather/home/data/models/forecast_weather_model.dart';


abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final CurrentWeatherModel current;
  final ForecastWeatherModel forecast;
    final String prediction;


  WeatherLoaded(this.current, this.forecast, this.prediction);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}