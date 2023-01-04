import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'authorization_group.g.dart';

@JsonSerializable()
class AuthorizationGroup {
  int? id;
  String? authorizationGroupName;
  String? authorizationGroupCode;
  int? status;

  AuthorizationGroup({
    this.id,
    this.authorizationGroupName,
    this.authorizationGroupCode,
    this.status,
  });

  factory AuthorizationGroup.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationGroupFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationGroupToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(authorizationGroupName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
