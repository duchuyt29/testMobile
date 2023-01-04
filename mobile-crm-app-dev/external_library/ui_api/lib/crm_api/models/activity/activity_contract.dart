import 'package:json_annotation/json_annotation.dart';

part 'activity_contract.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityContract {
  int? accountId;
  int? id;
  String? contractNumber;
  String? contractNumberInput;
  int? contractAccountId;

  ActivityContract({
    this.accountId,
    this.id,
    this.contractNumber,
    this.contractNumberInput,
    this.contractAccountId,
  });

  factory ActivityContract.fromJson(Map<String, dynamic> json) =>
      _$ActivityContractFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityContractToJson(this);
}
