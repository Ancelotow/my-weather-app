class CoordinateDto {
  final double lon;
  final double lat;

  CoordinateDto({
    required this.lon,
    required this.lat,
  });

  factory CoordinateDto.fromJson(Map<String, dynamic> json) => CoordinateDto(
    lon: json["lon"],
    lat: json["lat"],
  );
}
