import 'package:json_annotation/json_annotation.dart';

import '../../models/domain/domain_info.dart';
import '../../models/domain/domain_item.dart';
import '../base_response.dart';

part 'domain_info_response.g.dart';

@JsonSerializable()
class DomainInfoResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DomainInfo? data;

  DomainInfoResponse({this.data}) : super(false);

  factory DomainInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$DomainInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DomainInfoResponseToJson(this);
}
