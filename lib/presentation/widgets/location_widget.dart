import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/models/location.dart';

import '../themes/dimens.dart';

class LocationWidget extends StatelessWidget {

  final Location location;

  const LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.regularRadius)),
        color: Colors.grey
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.regularPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${location.weather.temperatureCurrent.toStringAsFixed(2)}°C"),
                Text("${location.name}, ${location.countryCode}"),
              ],
            ),
            Image.asset("assets/images/weather/cloud.png", width: 20,) // TODO
          ],
        ),
      )
    );
  }
}
