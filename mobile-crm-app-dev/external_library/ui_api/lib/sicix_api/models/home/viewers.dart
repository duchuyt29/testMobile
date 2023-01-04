import 'package:json_annotation/json_annotation.dart';

part 'viewers.g.dart';

@JsonSerializable()
class Viewers {
  int? view;
  bool? hasView;

  Viewers({
    this.view,
    this.hasView,
  });

  factory Viewers.fromJson(Map<String, dynamic> json) =>
      _$ViewersFromJson(json);

  Map<String, dynamic> toJson() => _$ViewersToJson(this);
}
