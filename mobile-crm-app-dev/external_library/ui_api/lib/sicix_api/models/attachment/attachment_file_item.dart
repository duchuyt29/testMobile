import 'package:json_annotation/json_annotation.dart';

import '../home/user.dart';

part 'attachment_file_item.g.dart';

@JsonSerializable()
class AttachmentFileItem {
  String? id;
  String? name;
  String? createDate;
  String? contentType;
  int? length;
  User? createBy;

  // trường ref này nếu != null, thì là id của file gốc
  String? ref;

  AttachmentFileItem({
    this.id,
    this.name,
    this.createDate,
    this.contentType,
    this.length,
    this.createBy,
    this.ref,
  });

  factory AttachmentFileItem.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFileItemFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentFileItemToJson(this);
}
