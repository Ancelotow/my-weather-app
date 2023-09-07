import 'package:my_weather_app/data/dto/coordinate_dto.dart';
import 'package:my_weather_app/data/dto/main_dto.dart';
import 'package:my_weather_app/data/dto/system_dto.dart';
import 'package:my_weather_app/data/dto/weather_dto.dart';
import 'package:my_weather_app/data/dto/wind_dto.dart';
import 'package:my_weather_app/domain/models/location.dart';
import 'package:my_weather_app/domain/models/weather_information.dart';

class ResponseDto {
  final int id;
  final String name;
  final int visibility;
  final WeatherDto weather;
  final WindDto wind;
  final MainDto main;
  final SystemDto sys;
  final CoordinateDto coord;

  static const double _kelvin = 273.15;

  ResponseDto({
    required this.id,
    required this.name,
    required this.visibility,
    required this.weather,
    required this.wind,
    required this.main,
    required this.sys,
    required this.coord,
  });

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        id: json["id"],
        name: json["name"],
        visibility: json["visibility"],
        main: MainDto.fromJson(json["main"]),
        wind: WindDto.fromJson(json["wind"]),
        weather: WeatherDto.fromJson(json["weather"][0]),
        coord: CoordinateDto.fromJson(json["coord"]),
        sys: SystemDto.fromJson(json["sys"]),
      );

  Location toLocation() => Location(
        name: name,
        latitude: coord.lat,
        longitude: coord.lon,
        countryCode: sys.country,
        weather: WeatherInformation(
          temperatureCurrent:  main.temp - _kelvin,
          pressure: main.pressure.toInt(),
          wind: wind.speed,
          visibility: visibility,
          humidity: main.humidity.toInt(),
          temperatureMax: main.tempMax - _kelvin,
          temperatureMin: main.tempMin - _kelvin,
          weatherName: weather.description,
        ),
      );
}
