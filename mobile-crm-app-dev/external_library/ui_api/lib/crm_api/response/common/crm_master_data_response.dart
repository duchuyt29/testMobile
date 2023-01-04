import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../../models/common/crm_master_data/crm_master_data.dart';
import '../base_response.dart';

part 'crm_master_data_response.g.dart';

@JsonSerializable()
class CrmMasterDataResponse extends BaseResponse {
  @JsonKey(name: 'data')
  CrmMasterData? data;
  CrmMasterDataResponse({this.data}) : super(false);

  factory CrmMasterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CrmMasterDataResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CrmMasterDataResponseToJson(this);
}
