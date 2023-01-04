import 'package:json_annotation/json_annotation.dart';

part 'domain_url.g.dart';

@JsonSerializable()
class DomainUrl {
  String? api;
  String? media;

  DomainUrl({this.api, this.media});

  factory DomainUrl.fromJson(Map<String, dynamic> json) =>
      _$DomainUrlFromJson(json);

  Map<String, dynamic> toJson() => _$DomainUrlToJson(this);
}
