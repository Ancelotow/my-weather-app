import 'package:my_weather_app/data/data_source/weather_data_source.dart';
import 'package:my_weather_app/data/dto/response_dto.dart';
import 'package:my_weather_app/domain/models/location.dart';
import 'package:my_weather_app/domain/repositories/weather_repository.dart';

class WeatherApiRepository implements WeatherRepository {

  final WeatherDataSource _dataSource;

  WeatherApiRepository(this._dataSource);

  @override
  Future<Location> getWeatherFromLocation(double lat, double long) async {
    final response = await _dataSource.getFromCoordinate(lat, long);
    return response.toLocation();
  }

  @override
  Future<List<Location>> getWeatherTowns(List<String> townNames) async {
    final responses = <ResponseDto>[];
    for(var name in townNames) {
      final response = await _dataSource.getFromTownName(name);
      responses.add(response);
    }
    return responses.map((e) => e.toLocation()).toList();
  }

}