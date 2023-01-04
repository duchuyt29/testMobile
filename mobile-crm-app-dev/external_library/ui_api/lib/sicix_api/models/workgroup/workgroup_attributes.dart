import 'package:json_annotation/json_annotation.dart';

import 'workgroup_attribute.dart';

part 'workgroup_attributes.g.dart';

@JsonSerializable()
class WorkgroupAttributes {
  @JsonKey(name: 'POST')
  WorkgroupAttribute? post;
  @JsonKey(name: 'EVENT')
  WorkgroupAttribute? event;

  WorkgroupAttributes({this.post, this.event});

  factory WorkgroupAttributes.fromJson(Map<String, dynamic> json) {
    return _$WorkgroupAttributesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkgroupAttributesToJson(this);
}
