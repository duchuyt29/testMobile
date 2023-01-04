import 'package:json_annotation/json_annotation.dart';

part 'lead_used.g.dart';

@JsonSerializable()
class LeadUsed {
  int? totalUsed;
  int? isUsed;

  LeadUsed({this.totalUsed, this.isUsed});

  factory LeadUsed.fromJson(Map<String, dynamic> json) {
    return _$LeadUsedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadUsedToJson(this);
}
