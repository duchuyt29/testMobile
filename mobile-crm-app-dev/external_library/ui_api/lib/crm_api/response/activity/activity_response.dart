import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_content.dart';
import '../../models/base_models.dart';
import '../base_response.dart';

part 'activity_response.g.dart';

@JsonSerializable()
class ActivityResponse extends BaseResponse {
  @JsonKey(name: 'data')
  ActivityData? data;
  ActivityResponse({this.data}) : super(false);

  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityResponseToJson(this);
}

@JsonSerializable()
class ActivityData extends BaseModels {
  List<ActivityContent>? content;
  ActivityData({this.content});

  factory ActivityData.fromJson(Map<String, dynamic> json) =>
      _$ActivityDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityDataToJson(this);
}
