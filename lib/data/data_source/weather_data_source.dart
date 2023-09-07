import 'package:my_weather_app/data/dto/response_dto.dart';

abstract class WeatherDataSource {

  Future<ResponseDto> getFromTownName(String town);

  Future<ResponseDto> getFromCoordinate(double latitude, double longitude);

}