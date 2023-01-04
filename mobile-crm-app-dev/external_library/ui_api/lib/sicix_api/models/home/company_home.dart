import 'package:json_annotation/json_annotation.dart';

part 'company_home.g.dart';

@JsonSerializable()
class CompanyHome {
  final int? id;
  final String? name;
  final String? email;
  final String? domain;
  final int? status;

  const CompanyHome({
    this.id,
    this.name,
    this.email,
    this.domain,
    this.status,
  });

  factory CompanyHome.fromJson(Map<String, dynamic> json) =>
      _$CompanyHomeFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyHomeToJson(this);
}
