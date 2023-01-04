import 'package:json_annotation/json_annotation.dart';

import 'domain_sso.dart';
import 'domain_url.dart';

part 'domain_info.g.dart';

@JsonSerializable()
class DomainInfo {
  DomainSso? sso;
  DomainUrl? url;

  DomainInfo({this.sso, this.url});

  factory DomainInfo.fromJson(Map<String, dynamic> json) {
    return _$DomainInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DomainInfoToJson(this);
}
