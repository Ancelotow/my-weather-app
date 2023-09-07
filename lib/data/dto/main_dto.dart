class MainDto {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainDto({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainDto.fromJson(Map<String, dynamic> json) => MainDto(
    temp: double.parse(json["temp"]),
    feelsLike: double.parse(json["feels_like"]),
    tempMin: double.parse(json["temp_min"]),
    tempMax: double.parse(json["temp_max"]),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );
}
