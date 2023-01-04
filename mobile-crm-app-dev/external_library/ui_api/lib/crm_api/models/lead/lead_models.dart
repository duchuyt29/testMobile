import 'package:json_annotation/json_annotation.dart';

import '../base_models.dart';
import 'lead_model.dart';

part 'lead_models.g.dart';

@JsonSerializable()
class LeadModels extends BaseModels {
  @JsonKey(defaultValue: [])
  final List<LeadModel>? content;

  LeadModels({this.content}) : super();

  factory LeadModels.fromJson(Map<String, dynamic> json) =>
      _$LeadModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadModelsToJson(this);
}
