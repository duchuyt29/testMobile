import 'package:json_annotation/json_annotation.dart';

part 'change_company_request.g.dart';

@JsonSerializable()
class ChangeCompanyRequest {
  final int lastCompanyId;

  ChangeCompanyRequest(this.lastCompanyId);

  factory ChangeCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeCompanyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeCompanyRequestToJson(this);
}
