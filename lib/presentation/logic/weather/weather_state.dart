part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherLoading extends WeatherState { }

class WeatherSuccess extends WeatherState {
  final List<Location> locations;
  final Location currentLocation;

  WeatherSuccess({
    required this.locations,
    required this.currentLocation,
  });
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError(this.errorMessage);
}
