import 'package:json_annotation/json_annotation.dart';

import '../../lead/lead_stage_reason.dart';

part 'lead_stage.g.dart';

@JsonSerializable()
class LeadStage {
  static const int leadOpen = 1;
  static const int leadProcessing = 2;
  static const int leadDone = 3;
  static const int leadDoneConvert = 3;
  static const int leadDoneNotConvert = 4;

  static List<LeadStage> getLeadStages() {
    return <LeadStage>[
      LeadStage(id: leadOpen, leadStageName: 'Mở - Chưa liên lạc'),
      LeadStage(
          id: leadProcessing, leadStageName: 'Đang thực hiện - Đã liên lạc'),
      LeadStage(id: leadDone, leadStageName: 'Đóng', subLeadStages: [
        LeadStage(id: leadDoneConvert, leadStageName: 'Đóng - Chuyển đổi'),
        LeadStage(
            id: leadDoneNotConvert, leadStageName: 'Đóng - Không chuyển đổi'),
      ]),
    ];
  }

  String? leadStageName;
  int? id;
  List<LeadStage>? subLeadStages;

  LeadStageReason? leadStageReason;

  LeadStage({this.leadStageName, this.id, this.subLeadStages});

  factory LeadStage.fromJson(Map<String, dynamic> json) {
    return _$LeadStageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadStageToJson(this);
}
