import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../base_models.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String? subject;
  String? id;
  String? content;
  DateTime? createDate;
  int? status;

  NotificationModel(
    this.subject,
    this.id,
    this.content,
    this.createDate,
    this.status,
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  String getCreateDate() {
    if (createDate == null) {
      return '';
    }
    final hours = DateTime.now().difference(createDate!).inHours;
    if (hours < 24) {
      return DateUtil.formatDatetimeToString(createDate,
          type: DateUtil.TIME_TYPE);
    } else {
      return DateUtil.formatDatetimeToString(createDate);
    }
  }

  String getTime() {
    // final storage = Get.find<SharedPreferences>();
    // if (createDate != null) {
    //   if (storage
    //           .getString(StorageConstants.language)!
    //           .compareTo(VIETNAMESE_LANG) ==
    //       0) {
    //     timeago.setLocaleMessages('vi', timeago.ViMessages());
    //     return timeago.format(createDate!, locale: 'vi');
    //   } else {
    //     timeago.setLocaleMessages('en', timeago.EnMessages());
    //     return timeago.format(createDate!, locale: 'en');
    //   }
    // }
    return createDate == null
        ? ''
        : timeago.format(createDate!, locale: 'locale'.tr);
  }
}

@JsonSerializable()
class NotificationModels extends BaseModels {
  @JsonKey(defaultValue: [])
  List<NotificationModel> content;
  int? unread;

  NotificationModels(this.content, this.unread);

  factory NotificationModels.fromJson(Map<String, dynamic> json) {
    return _$NotificationModelsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$NotificationModelsToJson(this);
}
