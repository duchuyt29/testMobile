import 'package:json_annotation/json_annotation.dart';

part 'group_home.g.dart';

@JsonSerializable()
class GroupHome {
  final int? id;

  const GroupHome({
    this.id,
  });

  factory GroupHome.fromJson(Map<String, dynamic> json) =>
      _$GroupHomeFromJson(json);

  Map<String, dynamic> toJson() => _$GroupHomeToJson(this);
}
