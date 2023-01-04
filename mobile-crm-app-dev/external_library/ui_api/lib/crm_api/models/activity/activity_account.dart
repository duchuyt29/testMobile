import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'activity_account.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityAccount {
  int? id;
  String? accountName;

  ActivityAccount({
    this.id,
    this.accountName,
  });

  factory ActivityAccount.fromJson(Map<String, dynamic> json) =>
      _$ActivityAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityAccountToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(accountName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
