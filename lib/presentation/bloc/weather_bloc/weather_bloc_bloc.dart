import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/entity/weather_entity.dart';
import 'package:weather_app/domain/usecases/get_weather_by_city.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherState> {
  final GetWeatherByCity getWeatherByCity;

  WeatherBloc({required this.getWeatherByCity}) : super(WeatherInitial()) {
    on<WeatherSearchEvent>((event, emit) async {
      emit(WeatherLoadingState());

      try {
        final WeatherEntity weather =
            await getWeatherByCity.call(event.cityName);
        emit(WeatherLoadedState(weather: weather));
      } catch (e) {
        emit(WeatherErrorState(error: e.toString()));
      }
    });
  }
}
