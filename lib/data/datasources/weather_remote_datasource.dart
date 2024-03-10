import 'package:weather_app/data/model/weather_model.dart';

abstract class WeatherRemoteDatasource{

  Future<WeatherModel> getWeatherByCity(String cityName);
  
}