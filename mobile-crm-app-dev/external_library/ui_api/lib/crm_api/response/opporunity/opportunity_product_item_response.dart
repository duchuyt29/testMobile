import 'package:json_annotation/json_annotation.dart';

import '../../models/opportunity/opportunity_product_item.dart';
import '../base_response.dart';

part 'opportunity_product_item_response.g.dart';

@JsonSerializable()
class OpportunityProductItemResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<OpportunityProductItem>? data;

  OpportunityProductItemResponse({this.data}) : super(false);

  factory OpportunityProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OpportunityProductItemResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityProductItemResponseToJson(this);
}
