import 'package:json_annotation/json_annotation.dart';

part 'themes.g.dart';

@JsonSerializable()
class Themes {
  final int? scale;
  final String? theme;
  final String? notificationSound;

  const Themes({this.scale, this.theme, this.notificationSound});

  factory Themes.fromJson(Map<String, dynamic> json) {
    return _$ThemesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ThemesToJson(this);
}
