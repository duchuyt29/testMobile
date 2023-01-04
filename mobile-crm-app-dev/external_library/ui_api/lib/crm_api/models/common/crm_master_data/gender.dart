import 'package:json_annotation/json_annotation.dart';

part 'gender.g.dart';

@JsonSerializable()
class Gender {
  static final male = Gender(genderName: 'Nam', id: 1);
  static final female = Gender(genderName: 'Nữ', id: 2);
  static final other = Gender(genderName: 'Khác', id: 3);

  String? genderName;
  int? id;

  Gender({this.genderName, this.id});

  factory Gender.fromJson(Map<String, dynamic> json) {
    return _$GenderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenderToJson(this);
}
