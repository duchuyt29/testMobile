import 'package:json_annotation/json_annotation.dart';

import '../../models/common/crm_master_data/document_type.dart';
import '../base_response.dart';

part 'crm_document_type_response.g.dart';

@JsonSerializable()
class CrmDocumentTypeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<DocumentType>? data;
  CrmDocumentTypeResponse({this.data}) : super(false);

  factory CrmDocumentTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$CrmDocumentTypeResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CrmDocumentTypeResponseToJson(this);
}
