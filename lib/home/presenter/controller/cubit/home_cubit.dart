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
      final forecast = await repository.getForecast(region);
      emit(WeatherLoaded(current, forecast));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
