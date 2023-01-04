import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_stage.dart';
import 'package:ui_api/crm_api/models/lead/lead_stage_reason.dart';
import 'package:ui_api/crm_api/repository/crm_api_repository.dart';

import '../../../data/app_data_global.dart';
import '../../constants/colors.dart';
import '../button/widget_button.dart';
import '../form/widget_input_label.dart';

class WidgetCrmLeadStageClose extends StatefulWidget {
  final List<LeadStage> leadStages;
  final LeadStage? currentLeadStage;
  final Function(LeadStage?) onSaveLeadStage;

  const WidgetCrmLeadStageClose({
    Key? key,
    required this.leadStages,
    required this.onSaveLeadStage,
    this.currentLeadStage,
  }) : super(key: key);

  @override
  State<WidgetCrmLeadStageClose> createState() =>
      _WidgetCrmLeadStageCloseState();
}

class _WidgetCrmLeadStageCloseState extends State<WidgetCrmLeadStageClose> {
  final _crmUIRepository = Get.find<CrmApiRepository>();

  LeadStage? _currentStage;
  List<LeadStageReason> _leadStageReasons = [];

  @override
  void initState() {
    super.initState();
    _currentStage = widget.currentLeadStage ?? widget.leadStages.first;
    if (_currentStage != null) {
      _callGetLeadStageReason(_currentStage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 0.8,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              const Divider(),
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: getCount(),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(14, 15, 14, 0),
                          child: WidgetInputLabel(
                              label: 'Giai đoạn', isRequired: true),
                        );
                      } else if (index <= widget.leadStages.length) {
                        return _buildLeadStageCell(
                            widget.leadStages[index - 1]);
                      } else if (index == (widget.leadStages.length + 1)) {
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                          child: WidgetInputLabel(
                              label: 'Lý do từ chối', isRequired: true),
                        );
                      } else {
                        return _buildLeadStageReasonCell(_leadStageReasons[
                            index - widget.leadStages.length - 2]);
                      }
                    }),
              ),
              WidgetButton(
                title: 'save'.tr,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  if (_leadStageReasons.isNotEmpty &&
                      _currentStage?.leadStageReason == null) {
                    EasyLoading.showToast('Bạn chưa chọn lý do từ chối!');
                    return;
                  }
                  Get.back();
                  widget.onSaveLeadStage(_currentStage);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  int getCount() {
    var count = widget.leadStages.length + 1;
    if (_leadStageReasons.isNotEmpty) {
      count += _leadStageReasons.length + 1;
    }
    return count;
  }

  ListTile _buildLeadStageCell(LeadStage stage) {
    return ListTile(
      onTap: () {
        if (stage.id == _currentStage?.id) {
          return;
        }
        setState(() {
          _currentStage = stage;
        });
        _callGetLeadStageReason(stage);
      },
      title: Text(stage.leadStageName ?? ''),
      leading: stage.id == _currentStage?.id
          ? Icon(
              Icons.radio_button_checked,
              color: AppColor.primaryColor,
            )
          : Icon(
              Icons.radio_button_off,
              color: AppColor.primaryColor,
            ),
    );
  }

  ListTile _buildLeadStageReasonCell(LeadStageReason leadStageReason) {
    return ListTile(
      onTap: () {
        setState(() {
          _currentStage?.leadStageReason = leadStageReason;
        });
      },
      title: Text(leadStageReason.leadStageReasonName ?? ''),
      leading: leadStageReason.id == _currentStage?.leadStageReason?.id
          ? Icon(
              Icons.radio_button_checked,
              color: AppColor.primaryColor,
            )
          : Icon(
              Icons.radio_button_off,
              color: AppColor.primaryColor,
            ),
    );
  }

  Future _callGetLeadStageReason(LeadStage leadStage) async {
    if (AppDataGlobal.leadStageReasons[leadStage.id] != null) {
      setState(() {
        _leadStageReasons = AppDataGlobal.leadStageReasons[leadStage.id]!;
      });
      return;
    }

    await EasyLoading.show();
    await _crmUIRepository
        .leadStageReason(leadStage.id ?? 0)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.leadStageReasons[leadStage.id ?? 0] = response.data ?? [];
        setState(() {
          _leadStageReasons = response.data ?? [];
        });
      } else {
        await EasyLoading.showToast(response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: 'Get lead reason close not convert $onError');
      EasyLoading.showToast('notify.error'.tr);
    });
  }
}
