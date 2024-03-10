part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final WeatherEntity weather;
  WeatherLoadedState({required this.weather});
}

final class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState({required this.error});
}
