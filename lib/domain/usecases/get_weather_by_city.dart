import 'package:weather_app/domain/entity/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class GetWeatherByCity{
  WeatherRepository weatherRepository;

  GetWeatherByCity({required this.weatherRepository});

  Future<WeatherEntity> call(String cityName)async{
    //WeatherEntity data = await weatherRepository.getWeatherByCity(cityName);
    return weatherRepository.getWeatherByCity(cityName);
  }
}