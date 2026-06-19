import 'package:json_annotation/json_annotation.dart';

part 'moon_phase_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MoonPhaseModel {
  final PhaseProperties properties;

  MoonPhaseModel({required this.properties});

  factory MoonPhaseModel.fromJson(Map<String, dynamic> json) => 
      _$MoonPhaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoonPhaseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PhaseProperties {
  final UsnoData data;

  PhaseProperties({required this.data});

  factory PhaseProperties.fromJson(Map<String, dynamic> json) => 
      _$UsnoPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$UsnoPropertiesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsnoData {
  @JsonKey(name: 'curphase')
  final String currentPhase;

  @JsonKey(name: 'fracillum')
  final String fractionIllumination;

  @JsonKey(name: 'moondata')
  final List<PhenomenaData> moonData;

  @JsonKey(name: 'sundata')
  final List<PhenomenaData> sunData;

  @JsonKey(name: 'closestphase')
  final ClosestPhase closestPhase;

  UsnoData({
    required this.currentPhase,
    required this.fractionIllumination,
    required this.moonData,
    required this.sunData,
    required this.closestPhase,
  });

  factory UsnoData.fromJson(Map<String, dynamic> json) => 
      _$UsnoDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsnoDataToJson(this);
}

@JsonSerializable()
class PhenomenaData {
  final String phen; // Ex: "Rise", "Set", "Upper Transit"
  final String time; // Ex: "07:37"

  PhenomenaData({required this.phen, required this.time});

  factory PhenomenaData.fromJson(Map<String, dynamic> json) => 
      _$PhenomenaDataFromJson(json);

  Map<String, dynamic> toJson() => _$PhenomenaDataToJson(this);
}

@JsonSerializable()
class ClosestPhase {
  final String phase;
  final int day;
  final int month;
  final int year;
  final String time;

  ClosestPhase({
    required this.phase,
    required this.day,
    required this.month,
    required this.year,
    required this.time,
  });

  factory ClosestPhase.fromJson(Map<String, dynamic> json) => 
      _$ClosestPhaseFromJson(json);

  Map<String, dynamic> toJson() => _$ClosestPhaseToJson(this);
}