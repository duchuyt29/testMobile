import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final int? companyId;
  final String? username;
  final String? fullName;
  final String? locale;
  final int? status;
  String? avatar;

  User({
    this.id,
    this.companyId,
    this.username,
    this.fullName,
    this.locale,
    this.status,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getAvatar() {
    return PathService.imagePath(avatar ?? '');
  }
}
