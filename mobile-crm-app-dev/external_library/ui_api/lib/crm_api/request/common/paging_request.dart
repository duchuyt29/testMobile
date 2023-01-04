import 'package:json_annotation/json_annotation.dart';

part 'paging_request.g.dart';

@JsonSerializable()
class PagingRequest {
  final int? page;
  final int? size;
  final String? sort;

  PagingRequest({
    this.page = 0,
    this.size = 10,
    this.sort = 'id,desc',
  });

  factory PagingRequest.fromJson(Map<String, dynamic> json) =>
      _$PagingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PagingRequestToJson(this);
}
