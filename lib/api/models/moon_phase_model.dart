import 'package:json_annotation/json_annotation.dart';

part 'moon_phase_model.g.dart';
@JsonSerializable()
class MoonPhaseModel {
  final String phase;
  final double illumination;
  final String date;

  MoonPhaseModel({
    required this.phase,
    required this.illumination,
    required this.date,
  });

  factory MoonPhaseModel.fromJson(Map<String, dynamic> json) => 
      _$MoonPhaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoonPhaseModelToJson(this);
}