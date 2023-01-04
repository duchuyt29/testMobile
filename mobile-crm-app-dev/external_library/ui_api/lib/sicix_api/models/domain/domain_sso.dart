import 'package:json_annotation/json_annotation.dart';

part 'domain_sso.g.dart';

@JsonSerializable()
class DomainSso {
  String? realm;
  String? resource;
  @JsonKey(name: 'ssl-required')
  String? sslRequired;
  @JsonKey(name: 'public-client')
  bool? publicClient;
  @JsonKey(name: 'auth-server-url')
  String? authServerUrl;
  @JsonKey(name: 'confidential-port')
  int? confidentialPort;

  DomainSso({
    this.realm,
    this.resource,
    this.sslRequired,
    this.publicClient,
    this.authServerUrl,
    this.confidentialPort,
  });

  factory DomainSso.fromJson(Map<String, dynamic> json) =>
      _$DomainSsoFromJson(json);

  Map<String, dynamic> toJson() => _$DomainSsoToJson(this);
}
