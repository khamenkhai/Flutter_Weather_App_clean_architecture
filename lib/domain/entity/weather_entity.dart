class WeatherEntity {
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  int? timezone;
  Clouds? clouds;
  int? id;
  String? name;
  int? cod;

  WeatherEntity({
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.clouds,
    this.wind,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      weather: json['weather'] != null
          ? List<Weather>.from(
              json['weather'].map((x) => Weather.fromJson(x)))
          : null,
      base: json['base'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      clouds: json["clouds"] != null ? Clouds.fromJson(json["clouds"]) : null,
      visibility: json['visibility'],
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class Clouds {
    int? all;

    Clouds({
        this.all,
    });

    factory Clouds.fromJson(Map<String,dynamic> json){
      return Clouds(
        all: json["all"] ?? null
      );
    }
}


class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}


class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}
