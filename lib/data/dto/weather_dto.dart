class WeatherDto {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDto({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );
}
