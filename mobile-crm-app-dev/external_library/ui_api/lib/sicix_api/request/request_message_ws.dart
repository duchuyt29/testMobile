import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

part 'request_message_ws.g.dart';

@JsonSerializable(includeIfNull: false)
class RequestMessageWS {
  String? id;
  int? convId;
  int? cid;
  dynamic content;
  dynamic quote;

  @JsonKey(name: 'create_by')
  String? createBy;

  // Quote for reply message
  @JsonKey(toJson: _dateToString)
  DateTime? createDate;
  List<PreparedContent>? preparedContent;
  bool? prepared;
  String? type;
  @JsonKey(name: 'quote_create_date')
  String? quoteCreateDate;

  RequestMessageWS({
    this.id,
    this.convId,
    this.cid,
    this.createBy,
    this.content,
    this.quote,
    this.createDate,
    this.preparedContent,
    this.prepared,
    this.type,
    this.quoteCreateDate,
  });

  factory RequestMessageWS.fromJson(Map<String, dynamic> json) =>
      _$RequestMessageWSFromJson(json);

  Map<String, dynamic> toJson() => _$RequestMessageWSToJson(this);
}

@JsonSerializable()
class PreparedContent {
  String content;

  PreparedContent(this.content);

  factory PreparedContent.fromJson(Map<String, dynamic> json) =>
      _$PreparedContentFromJson(json);

  Map<String, dynamic> toJson() => _$PreparedContentToJson(this);
}

String? _dateToString(DateTime? date) {
  // return date?.toUtc().toString() ?? '';
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
