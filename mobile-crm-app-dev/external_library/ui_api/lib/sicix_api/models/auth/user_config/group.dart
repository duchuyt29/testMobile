import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final String? path;
  final String? code;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  final String? name;
  final int? id;
  final String? pathId;
  final String? type;

  const Group({
    this.path,
    this.code,
    this.parentId,
    this.name,
    this.id,
    this.pathId,
    this.type,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
