import 'package:json_annotation/json_annotation.dart';

part 'document_type.g.dart';

@JsonSerializable()
class DocumentType {
  String? documentTypeName;
  int? id;

  DocumentType({
    this.documentTypeName,
    this.id,
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) {
    return _$DocumentTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentTypeToJson(this);
}
