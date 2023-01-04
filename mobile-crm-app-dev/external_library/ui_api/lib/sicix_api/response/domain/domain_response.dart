import 'package:json_annotation/json_annotation.dart';

import '../../models/domain/domain_item.dart';
import '../base_response.dart';

part 'domain_response.g.dart';

@JsonSerializable()
class DomainResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DomainConfig? data;

  DomainResponse({this.data}) : super(false);

  factory DomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DomainResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DomainResponseToJson(this);
}
