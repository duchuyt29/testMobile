import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'ward.g.dart';

@JsonSerializable()
class Ward {
  String? wardName;
  int? id;

  Ward({
    this.wardName,
    this.id,
  });

  factory Ward.fromJson(Map<String, dynamic> json) {
    return _$WardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WardToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(wardName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
