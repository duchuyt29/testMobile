import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'opp_account.g.dart';

@JsonSerializable()
class OppAccount {
  String? accountName;
  int? id;

  OppAccount({
    this.accountName,
    this.id,
  });

  factory OppAccount.fromJson(Map<String, dynamic> json) =>
      _$OppAccountFromJson(json);

  Map<String, dynamic> toJson() => _$OppAccountToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(accountName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
