// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  temperature: (json['temperature_2m'] as num).toDouble(),
  windSpeed: (json['wind_speed_10m'] as num).toDouble(),
  windDirection: (json['wind_direction_10m'] as num).toInt(),
  weatherCode: (json['weather_code'] as num).toInt(),
  time: json['time'] as String,
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature,
      'wind_speed_10m': instance.windSpeed,
      'wind_direction_10m': instance.windDirection,
      'weather_code': instance.weatherCode,
      'time': instance.time,
    };
