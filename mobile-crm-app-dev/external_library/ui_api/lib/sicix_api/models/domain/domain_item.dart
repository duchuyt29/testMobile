import 'package:json_annotation/json_annotation.dart';

part 'domain_item.g.dart';

@JsonSerializable()
class DomainItem {
  String? url;
  @JsonKey(name: 'api_url')
  String? apiUrl;
  @JsonKey(name: 'identity_url')
  String? identityUrl;

  DomainItem({this.url, this.apiUrl, this.identityUrl});

  factory DomainItem.fromJson(Map<String, dynamic> json) {
    return _$DomainItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DomainItemToJson(this);
}

@JsonSerializable()
class DomainConfig {
  DomainItem? config;

  DomainConfig({this.config});

  factory DomainConfig.fromJson(Map<String, dynamic> json) {
    return _$DomainConfigFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DomainConfigToJson(this);
}
