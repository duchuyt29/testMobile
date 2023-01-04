import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/constants/common.dart';

part 'base_models.g.dart';

@JsonSerializable()
class BaseModels {
  int? pageSize;
  int? page;
  int? total;

  BaseModels({this.pageSize, this.page, this.total});

  factory BaseModels.fromJson(Map<String, dynamic> json) =>
      _$BaseModelsFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelsToJson(this);

  bool isMore() {
    return ((page ?? 0) + 1) * (pageSize ?? CommonConstants.defaultSize) <
        (total ?? 0);
  }
}
