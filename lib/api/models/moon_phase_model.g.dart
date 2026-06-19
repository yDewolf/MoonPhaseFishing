// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moon_phase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoonPhaseModel _$MoonPhaseModelFromJson(Map<String, dynamic> json) =>
    MoonPhaseModel(
      properties: PhaseProperties.fromJson(
        json['properties'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$MoonPhaseModelToJson(MoonPhaseModel instance) =>
    <String, dynamic>{'properties': instance.properties.toJson()};

PhaseProperties _$UsnoPropertiesFromJson(Map<String, dynamic> json) =>
    PhaseProperties(
      data: UsnoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsnoPropertiesToJson(PhaseProperties instance) =>
    <String, dynamic>{'data': instance.data.toJson()};

UsnoData _$UsnoDataFromJson(Map<String, dynamic> json) => UsnoData(
  currentPhase: json['curphase'] as String,
  fractionIllumination: json['fracillum'] as String,
  moonData: (json['moondata'] as List<dynamic>)
      .map((e) => PhenomenaData.fromJson(e as Map<String, dynamic>))
      .toList(),
  sunData: (json['sundata'] as List<dynamic>)
      .map((e) => PhenomenaData.fromJson(e as Map<String, dynamic>))
      .toList(),
  closestPhase: ClosestPhase.fromJson(
    json['closestphase'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UsnoDataToJson(UsnoData instance) => <String, dynamic>{
  'curphase': instance.currentPhase,
  'fracillum': instance.fractionIllumination,
  'moondata': instance.moonData.map((e) => e.toJson()).toList(),
  'sundata': instance.sunData.map((e) => e.toJson()).toList(),
  'closestphase': instance.closestPhase.toJson(),
};

PhenomenaData _$PhenomenaDataFromJson(Map<String, dynamic> json) =>
    PhenomenaData(phen: json['phen'] as String, time: json['time'] as String);

Map<String, dynamic> _$PhenomenaDataToJson(PhenomenaData instance) =>
    <String, dynamic>{'phen': instance.phen, 'time': instance.time};

ClosestPhase _$ClosestPhaseFromJson(Map<String, dynamic> json) => ClosestPhase(
  phase: json['phase'] as String,
  day: (json['day'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  year: (json['year'] as num).toInt(),
  time: json['time'] as String,
);

Map<String, dynamic> _$ClosestPhaseToJson(ClosestPhase instance) =>
    <String, dynamic>{
      'phase': instance.phase,
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'time': instance.time,
    };
