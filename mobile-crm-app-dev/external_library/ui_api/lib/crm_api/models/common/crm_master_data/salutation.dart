import 'package:json_annotation/json_annotation.dart';

part 'salutation.g.dart';

@JsonSerializable()
class Salutation {
  int? id;
  String? salutationName;
  int? status;

  Salutation({this.id, this.salutationName, this.status});

  factory Salutation.fromJson(Map<String, dynamic> json) {
    return _$SalutationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalutationToJson(this);
}
