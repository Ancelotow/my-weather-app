import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/presentation/logic/weather/weather_bloc.dart';
import 'package:my_weather_app/presentation/widgets/location_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(GetLocationsWeatherEvent());
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case WeatherSuccess:
            final locations = (state as WeatherSuccess).locations;
            return ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, position) {
                return LocationWidget(location: locations[position]);
              },
            );

          case WeatherError:
            final errorMessage = (state as WeatherError).errorMessage;
            return Text(errorMessage);

          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
