import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_contact.dart';
import '../base_response.dart';

part 'activity_contact_response.g.dart';

@JsonSerializable()
class ActivityContactResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityContact>? data;
  ActivityContactResponse({this.data}) : super(false);

  factory ActivityContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityContactResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityContactResponseToJson(this);
}
