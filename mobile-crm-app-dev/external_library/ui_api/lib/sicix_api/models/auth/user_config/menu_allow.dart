import 'package:json_annotation/json_annotation.dart';

part 'menu_allow.g.dart';

@JsonSerializable()
class MenuAllow {
  final String? code;
  final String? application;
  final String? parentCode;
  final int? sortOrder;
  final dynamic icon;
  final String? name;
  final String? type;
  final String? url;

  const MenuAllow({
    this.code,
    this.application,
    this.parentCode,
    this.sortOrder,
    this.icon,
    this.name,
    this.type,
    this.url,
  });

  factory MenuAllow.fromJson(Map<String, dynamic> json) {
    return _$MenuAllowFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MenuAllowToJson(this);
}
