import 'package:json_annotation/json_annotation.dart';

part 'duration_unit.g.dart';

@JsonSerializable()
class DurationUnit {
  String? durationUnitName;
  int? id;
  int? status;

  DurationUnit({this.durationUnitName, this.id, this.status});

  factory DurationUnit.fromJson(Map<String, dynamic> json) {
    return _$DurationUnitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DurationUnitToJson(this);
}
