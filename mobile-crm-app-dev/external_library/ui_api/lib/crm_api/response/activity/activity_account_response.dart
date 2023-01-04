import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_account.dart';
import '../base_response.dart';

part 'activity_account_response.g.dart';

@JsonSerializable()
class ActivityAccountResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityAccount>? data;
  ActivityAccountResponse({this.data}) : super(false);

  factory ActivityAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityAccountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityAccountResponseToJson(this);
}
