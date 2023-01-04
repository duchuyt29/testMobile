import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  final int? id;
  final String? name;
  final String? logo;
  final String? icon;
  final String? internationalName;

  const Company(
      {this.id, this.name, this.logo, this.icon, this.internationalName});

  factory Company.fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  String getAvatar() {
    return PathService.imagePath(logo ?? icon ?? '');
  }
}
