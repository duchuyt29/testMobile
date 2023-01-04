import 'package:json_annotation/json_annotation.dart';

part 'opportunity_item_request.g.dart';

@JsonSerializable()
class OpportunityItem {
  int? opportunityId;
  int? productPriceId;
  int? productId;
  int? quantity;
  int? salePrice;
  String? description;
  int? status;
  double? listPrice;
  int? id;

  OpportunityItem({
    this.opportunityId,
    this.productPriceId,
    this.productId,
    this.quantity,
    this.salePrice,
    this.description,
    this.status,
    this.listPrice,
    this.id,
  });

  factory OpportunityItem.fromJson(Map<String, dynamic> json) =>
      _$OpportunityItemFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityItemToJson(this);

  String getTotalAmount() {
    return (salePrice! * quantity!).toString();
  }
}

@JsonSerializable()
class OpportunityItemsRequest {
  List<OpportunityItem>? items;

  OpportunityItemsRequest({this.items});

  factory OpportunityItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$OpportunityItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityItemsRequestToJson(this);
}
