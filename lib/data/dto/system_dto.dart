class SystemDto {
  final int type;
  final int id;
  final String country;
  final DateTime sunrise;
  final DateTime sunset;

  SystemDto({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SystemDto.fromJson(Map<String, dynamic> json) => SystemDto(
    type: json["type"],
    id: json["id"],
    country: json["country"],
    sunrise: DateTime.parse(json["sunrise"]),
    sunset:  DateTime.parse(json["sunset"]),
  );
}
