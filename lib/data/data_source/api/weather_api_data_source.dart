import 'package:dio/dio.dart';
import 'package:my_weather_app/data/data_source/weather_data_source.dart';
import 'package:my_weather_app/data/dto/response_dto.dart';

class WeatherApiDataSource implements WeatherDataSource {
  
  final Dio _dio;
  
  WeatherApiDataSource(this._dio);
  
  @override
  Future<ResponseDto> getFromCoordinate(double latitude, double longitude) async {
    final response = await _dio.get("weather", queryParameters: {
      "lat": latitude,
      "lon": longitude,
    });
    return ResponseDto.fromJson(response.data);
  }

  @override
  Future<ResponseDto> getFromTownName(String town) async {
    final response = await _dio.get("/weather", queryParameters: {
      "q": town,
    });
    return ResponseDto.fromJson(response.data);
  }
  
}