import 'dart:convert';

import 'package:weather_app/const.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource{


  @override
  Future<WeatherModel> getWeatherByCity(String cityName) async{
    final url = Uri.parse("${Const.BASE_URL}q=${cityName}&appid=${Const.API_KEY}");
    print("api url : ${url}");
    final response = await http.get(url);

    if(response.statusCode == 200 || response.statusCode == 201){
      final data = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    }else{
      throw Exception();
    }
    
  }
  
}