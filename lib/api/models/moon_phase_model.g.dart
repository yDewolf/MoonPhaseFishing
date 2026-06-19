// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moon_phase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoonPhaseModel _$MoonPhaseModelFromJson(Map<String, dynamic> json) =>
    MoonPhaseModel(
      phase: json['phase'] as String,
      illumination: (json['illumination'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$MoonPhaseModelToJson(MoonPhaseModel instance) =>
    <String, dynamic>{
      'phase': instance.phase,
      'illumination': instance.illumination,
      'date': instance.date,
    };
