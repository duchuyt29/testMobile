import 'package:json_annotation/json_annotation.dart';

part 'lead_info_request.g.dart';

@JsonSerializable(includeIfNull: false)
class LeadInfoRequest {
  int? id;
  String? leadName;
  int? genderId;
  String? leadPhone;
  int? salutationId;
  String? leadEmail;
  String? leadTitle;
  String? company;
  int? leadIndustryId;
  int? leadSourceId;
  String? sourceDescription;

  LeadInfoRequest({
    this.id,
    this.leadName,
    this.genderId,
    this.leadPhone,
    this.salutationId,
    this.leadEmail,
    this.leadTitle,
    this.company,
    this.leadIndustryId,
    this.leadSourceId,
    this.sourceDescription,
  });

  factory LeadInfoRequest.fromJson(Map<String, dynamic> json) {
    return _$LeadInfoRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadInfoRequestToJson(this);
}
