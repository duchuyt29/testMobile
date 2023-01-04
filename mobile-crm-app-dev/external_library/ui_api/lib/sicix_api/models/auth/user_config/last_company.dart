import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/services/path_service.dart';

part 'last_company.g.dart';

@JsonSerializable()
class LastCompany {
  final String? name;
  final String? logo;
  final dynamic icon;
  final dynamic banner;
  final dynamic background;
  final dynamic cssFileId;

  const LastCompany({
    this.name,
    this.logo,
    this.icon,
    this.banner,
    this.background,
    this.cssFileId,
  });

  factory LastCompany.fromJson(Map<String, dynamic> json) {
    return _$LastCompanyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LastCompanyToJson(this);

  String getAvatar() {
    return PathService.imagePath(logo ?? icon ?? '');
  }
}
