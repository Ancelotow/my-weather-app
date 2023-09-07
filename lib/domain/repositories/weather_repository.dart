import '../models/location.dart';

abstract class WeatherRepository {

  Future<List<Location>> getWeatherTowns(List<String> townNames);

  Future<Location> getWeatherFromLocation(double lat, double long);

}