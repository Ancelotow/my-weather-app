import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_weather_app/config/api_service.dart';
import 'package:my_weather_app/data/data_source/api/weather_api_data_source.dart';
import 'package:my_weather_app/data/repositories/api/weather_api_repository.dart';
import 'package:my_weather_app/presentation/logic/weather/weather_bloc.dart';
import 'package:my_weather_app/presentation/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/environment/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherBloc(
            WeatherApiRepository(
              WeatherApiDataSource(ApiService.instance().dio),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'My weather app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Material(
          child: HomeView(),
        ),
      ),
    );
  }
}
