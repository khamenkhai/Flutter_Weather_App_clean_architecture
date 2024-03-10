import 'package:weather_app/domain/entity/weather_entity.dart';

abstract class WeatherRepository{

  Future<WeatherEntity> getWeatherByCity(String cityName);

}