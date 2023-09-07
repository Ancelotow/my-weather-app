import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {

  ApiService? _instance;
  final Dio dio;
  
  ApiService._(this.dio);

  ApiService instance() {
    if(_instance == null) {
      final options = BaseOptions(
        baseUrl: dotenv.env['API_BASE_URI'] ?? "",
        queryParameters: {
          "appid" : dotenv.env['API_KEY'] ?? "",
        },
      );
      _instance = ApiService._(Dio(options));
    }
    return _instance!;
  }

}