import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'district.g.dart';

@JsonSerializable()
class District {
  String? districtName;
  int? id;

  District({
    this.districtName,
    this.id,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return _$DistrictFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(districtName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
