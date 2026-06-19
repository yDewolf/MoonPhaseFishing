import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'temperature_2m')
  final double temperature;

  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed;

  @JsonKey(name: 'wind_direction_10m')
  final int windDirection;

  @JsonKey(name: 'weather_code')
  final int weatherCode;

  final String time;

  WeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherCode,
    required this.time,
  });

  /// Converte o nó 'current' do JSON da Open-Meteo para a nossa classe
  factory WeatherModel.fromJson(Map<String, dynamic> json) => 
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  /// Helper útil para o pescador sabendo o significado do WMO Weather Code
  String get weatherDescription {
    if (weatherCode == 0) return 'Céu limpo';
    if (weatherCode <= 3) return 'Parcialmente nublado';
    if (weatherCode <= 48) return 'Nevoeiro';
    if (weatherCode <= 67) return 'Chuva leve/moderada';
    if (weatherCode <= 82) return 'Pancadas de chuva';
    if (weatherCode >= 95) return 'Tempestade! Evite o mar';
    return 'Desconhecido';
  }
}