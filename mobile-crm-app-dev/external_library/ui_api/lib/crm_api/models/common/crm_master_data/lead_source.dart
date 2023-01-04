import 'package:json_annotation/json_annotation.dart';

part 'lead_source.g.dart';

@JsonSerializable()
class LeadSource {
  int? id;
  String? leadSourceName;

  LeadSource({this.id, this.leadSourceName});

  factory LeadSource.fromJson(Map<String, dynamic> json) {
    return _$LeadSourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadSourceToJson(this);
}
