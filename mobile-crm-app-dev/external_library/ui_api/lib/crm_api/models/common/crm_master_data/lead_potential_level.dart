import 'package:json_annotation/json_annotation.dart';

part 'lead_potential_level.g.dart';

@JsonSerializable()
class LeadPotentialLevel {
  String? leadPotentialLevelName;
  int? id;

  LeadPotentialLevel({this.leadPotentialLevelName, this.id});

  factory LeadPotentialLevel.fromJson(Map<String, dynamic> json) {
    return _$LeadPotentialLevelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadPotentialLevelToJson(this);
}
