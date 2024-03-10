import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/injection_container.dart';
import 'package:weather_app/presentation/bloc/weather_bloc/weather_bloc_bloc.dart';
import 'package:weather_app/presentation/pages/weatherPage.dart';
import 'package:weather_app/injection_container.dart' as ic;

void main() async {
  ///initialized dependency injection container
  await ic.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      ///initialize bloc at the initial state of the app 
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => getIt<WeatherBloc>()
                ..add(WeatherSearchEvent(cityName: "Yangon"))),
        ],
        child: WeatherPage(),
      ),
    );
  }
}
