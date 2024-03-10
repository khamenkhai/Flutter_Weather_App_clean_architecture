import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource_impl.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_weather_by_city.dart';
import 'package:weather_app/presentation/bloc/weather_bloc/weather_bloc_bloc.dart';

final getIt = GetIt.instance;

init() {
  // Bloc
  getIt.registerFactory(() => WeatherBloc(getWeatherByCity:  getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetWeatherByCity(weatherRepository:  getIt()));


  // Repositories
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(weatherRemoteDatasource: getIt()));

  // Data sources
  getIt.registerLazySingleton<WeatherRemoteDatasource>(() => WeatherRemoteDatasourceImpl());

  // Http service
  getIt.registerLazySingleton(() => http.Client());

}