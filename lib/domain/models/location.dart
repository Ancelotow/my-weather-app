import 'package:my_weather_app/domain/models/weather_information.dart';

class Location {

  final String name;
  final double latitude;
  final double longitude;
  final String countryCode;
  final WeatherInformation weather;

  Location({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.countryCode,
    required this.weather,
  });

}