import 'package:json_annotation/json_annotation.dart';

part 'party_involved_partner_function.g.dart';

@JsonSerializable()
class PartyInvolvedPartnerFunction {
  String? partyInvolvedPartnerFunctionName;
  int? id;

  PartyInvolvedPartnerFunction(
      {this.partyInvolvedPartnerFunctionName, this.id});

  factory PartyInvolvedPartnerFunction.fromJson(Map<String, dynamic> json) {
    return _$PartyInvolvedPartnerFunctionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PartyInvolvedPartnerFunctionToJson(this);
}
