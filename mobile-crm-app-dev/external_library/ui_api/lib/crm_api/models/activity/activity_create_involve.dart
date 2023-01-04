import 'package:json_annotation/json_annotation.dart';

part 'activity_create_involve.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityCreateInvolve {
  String? role;
  String involveType;
  List<String>? involveIds;

  ActivityCreateInvolve({
    this.role,
    this.involveType = 'user',
    this.involveIds,
  });

  factory ActivityCreateInvolve.fromJson(Map<String, dynamic> json) =>
      _$ActivityCreateInvolveFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityCreateInvolveToJson(this);
}
