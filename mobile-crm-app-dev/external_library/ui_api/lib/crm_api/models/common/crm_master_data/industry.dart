import 'package:json_annotation/json_annotation.dart';

part 'industry.g.dart';

@JsonSerializable()
class Industry {
  String? industryName;
  int? id;
  int? status;

  Industry({this.industryName, this.id, this.status});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return _$IndustryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
