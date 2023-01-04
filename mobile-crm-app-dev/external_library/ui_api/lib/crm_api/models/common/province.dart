import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  String? provinceName;
  int? id;

  Province({
    this.provinceName,
    this.id,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return _$ProvinceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(provinceName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
