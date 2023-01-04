import 'package:json_annotation/json_annotation.dart';

part 'activity_involves.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityInvolves {
  String? role;
  String? involveType;
  List<InvolveIds>? involveIds;
  int? companyId;

  ActivityInvolves({
    this.role,
    this.involveType,
    this.involveIds,
    this.companyId,
  });

  factory ActivityInvolves.fromJson(Map<String, dynamic> json) =>
      _$ActivityInvolvesFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityInvolvesToJson(this);
}

@JsonSerializable(includeIfNull: false)
class InvolveIds {
  String? avatar;
  String? id;
  int? companyId;
  String? username;
  String? fullName;
  String? locale;
  int? status;

  InvolveIds({
    this.avatar,
    this.id,
    this.companyId,
    this.username,
    this.fullName,
    this.locale,
    this.status,
  });

  factory InvolveIds.fromJson(Map<String, dynamic> json) =>
      _$InvolveIdsFromJson(json);

  Map<String, dynamic> toJson() => _$InvolveIdsToJson(this);
}
