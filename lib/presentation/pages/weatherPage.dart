import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/entity/weather_entity.dart';
import 'package:weather_app/presentation/bloc/weather_bloc/weather_bloc_bloc.dart';
import 'package:weather_app/presentation/widgets/weatherDetailWidget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController _searchController = TextEditingController();

  String currentCity = "Yangon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Text(
              //   "${currentCity}",
              //   style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              // ),
              Row(
                children: [
                  Icon(Icons.calendar_today_sharp),
                  SizedBox(width: 10),
                  Text(
                    "${DateFormat("dd MMMM, yyyy").format(DateTime.now())}",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 15,
                    ),
                    hintText: "Search City...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onSubmitted: (value) {
                    BlocProvider.of<WeatherBloc>(context).add(
                      WeatherSearchEvent(
                        cityName: "${_searchController.text}",
                      ),
                    );
                    setState(() {
                      currentCity = _searchController.text;
                    });
                  },
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is WeatherErrorState) {
                    return Expanded(
                        child: Center(child: Text("Can't found the city!")));
                  } else if (state is WeatherLoadedState) {
                    currentCity = "${state.weather.name}";
                    WeatherEntity weather = state.weather;

                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          ...weather.weather!.map((e) {
                            return Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/images/${e.icon}.png",
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                          SizedBox(height: 35),
                          Text(
                            "${weather.name}",
                            style: TextStyle(fontSize: 23),
                          ),
                          SizedBox(height: 35),
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 35,
                            children: [
                              WeatherDetailWidget(
                                image: "assets/images/temperature.png",
                                text: "${weather.main!.temp} ° F",
                              ),
                              WeatherDetailWidget(
                                image: "assets/images/wind.png",
                                text: "${weather.wind!.speed} km/h",
                              ),
                              WeatherDetailWidget(
                                image: "assets/images/humidity.png",
                                text: "${weather.main!.humidity} km/h",
                              ),
                              WeatherDetailWidget(
                                image: "assets/images/cloudy.png",
                                text: "${weather.main?.feelsLike}",
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Icon(Icons.wechat);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
