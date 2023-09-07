class WindDto {
  final double speed;
  final int deg;

  WindDto({
    required this.speed,
    required this.deg,
  });

  factory WindDto.fromJson(Map<String, dynamic> json) => WindDto(
    speed: json["speed"],
    deg: json["deg"],
  );
}
