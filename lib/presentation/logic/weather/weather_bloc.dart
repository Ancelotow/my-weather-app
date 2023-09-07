import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/models/location.dart';
import '../../../domain/repositories/weather_repository.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository _repository;

  WeatherBloc(this._repository) : super(WeatherLoading()) {
    on<GetLocationsWeatherEvent>(_getLocations);
  }

  void _getLocations(GetLocationsWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final towns = ["paris", "london", "new york", "seoul", "tokyo", "camberra"];
      final locations = await _repository.getWeatherTowns(towns);
      emit(WeatherSuccess(locations: locations, currentLocation: locations[0])); // TODO
    } catch(e) {
      emit(WeatherError(e.toString()));
    }
  }
}
