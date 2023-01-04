import 'package:json_annotation/json_annotation.dart';

part 'account_count.g.dart';

@JsonSerializable()
class AccountCount {
  int? totalUsed;
  int? isUsed;
  AccountCount({
    this.totalUsed,
    this.isUsed,
  });

  factory AccountCount.fromJson(Map<String, dynamic> json) =>
      _$AccountCountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCountToJson(this);
}
