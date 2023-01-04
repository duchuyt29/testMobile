import 'package:json_annotation/json_annotation.dart';

part 'main_group.g.dart';

@JsonSerializable()
class MainGroup {
  final String? path;
  final String? code;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  final String? name;
  final int? id;
  final String? pathId;
  final String? type;

  const MainGroup({
    this.path,
    this.code,
    this.parentId,
    this.name,
    this.id,
    this.pathId,
    this.type,
  });

  factory MainGroup.fromJson(Map<String, dynamic> json) {
    return _$MainGroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainGroupToJson(this);
}
