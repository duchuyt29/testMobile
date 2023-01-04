import 'package:json_annotation/json_annotation.dart';

import 'themes.dart';

part 'configs.g.dart';

@JsonSerializable(explicitToJson: true)
class Configs {
  @JsonKey(fromJson: _stringToInt)
  final int? lastCompanyId;
  final Themes? themes;

  const Configs({this.lastCompanyId, this.themes});

  factory Configs.fromJson(Map<String, dynamic> json) {
    return _$ConfigsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfigsToJson(this);
}

int? _stringToInt(dynamic number) {
  if (number == null) {
    return null;
  } else if (number is int) {
    return number;
  } else {
    return int.tryParse(number);
  }
}
