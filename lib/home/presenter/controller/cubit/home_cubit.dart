import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/home/domain/eather_repository.dart';
import 'package:weather/home/presenter/controller/cubit/home_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit(this.repository) : super(WeatherInitial());

  void fetchWeather(String region) async {
  emit(WeatherLoading());
  try {
    final current = await repository.getCurrentWeather(region);
    print('Current weather fetched: ${current.temperature}');
    final forecast = await repository.getForecast(region);
    print('Forecast fetched: ${forecast.days.length} days');

    String prediction = 'unknown';
    try {
      prediction = await repository.getAiPrediction(current);
      print('Prediction received: $prediction');
    } catch (e) {
      print('Error fetching prediction: $e');
      prediction = 'error';
    }

    emit(WeatherLoaded(current, forecast, prediction));
  } catch (e) {
    print('Error fetching weather: $e');
    emit(WeatherError(e.toString()));
  }
}
}