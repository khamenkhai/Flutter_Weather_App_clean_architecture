part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocEvent {}

class WeatherSearchEvent extends WeatherBlocEvent{
  final String cityName;
  WeatherSearchEvent({required this.cityName});
}
