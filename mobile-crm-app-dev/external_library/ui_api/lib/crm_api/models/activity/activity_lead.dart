import 'package:json_annotation/json_annotation.dart';

part 'activity_lead.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityLead {
  int? id;
  String? leadName;
  String? leadCode;

  ActivityLead({
    this.id,
    this.leadName,
    this.leadCode,
  });

  factory ActivityLead.fromJson(Map<String, dynamic> json) =>
      _$ActivityLeadFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityLeadToJson(this);
}
