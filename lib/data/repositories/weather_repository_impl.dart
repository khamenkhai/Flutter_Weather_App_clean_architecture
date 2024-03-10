import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/domain/entity/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRemoteDatasource weatherRemoteDatasource;

  WeatherRepositoryImpl({required this.weatherRemoteDatasource});

  @override
  Future<WeatherEntity> getWeatherByCity(String cityName) async {
    try {
      WeatherModel weatherEntity =
          await weatherRemoteDatasource.getWeatherByCity(cityName);
      WeatherEntity weather = weatherEntity.toEntity();
      return weather;
    } catch (e) {
      print("error messsage : ${e}");
      throw Exception(e);
    }
  }
}
