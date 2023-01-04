import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/opportunity_stage.dart';
import 'package:ui_api/crm_api/repository/crm_api_repository.dart';
import 'package:ui_api/crm_api/response/opporunity/opportunity_stage_reason_response.dart';

import '../../constants/colors.dart';
import '../../utils/dialog_util.dart';
import '../button/widget_button.dart';
import '../form/widget_input_label.dart';

class WidgetCrmOppDoneStage extends StatefulWidget {
  final List<OpportunityStage> opportunityStages;
  final OpportunityStage? currentOpportunityStage;
  final Function(
    OpportunityStage?,
  ) onSaveOpportunityStage;

  const WidgetCrmOppDoneStage({
    Key? key,
    required this.opportunityStages,
    required this.onSaveOpportunityStage,
    this.currentOpportunityStage,
  }) : super(key: key);

  @override
  State<WidgetCrmOppDoneStage> createState() => _WidgetCrmOppDoneStageState();
}

class _WidgetCrmOppDoneStageState extends State<WidgetCrmOppDoneStage> {
  OpportunityStage? currentStage;
  final _crmUIRepository = Get.find<CrmApiRepository>();

  List<OpportunityStageReason> _opportunityStageReasons = [];

  @override
  void initState() {
    super.initState();
    currentStage =
        widget.currentOpportunityStage ?? widget.opportunityStages.first;
    if (currentStage != null) {
      getStageReason(currentStage?.id ?? 0);
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
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(14, 15, 14, 0),
                          child: WidgetInputLabel(
                              label: 'crm.opportunity.stage'.tr,
                              isRequired: true),
                        );
                      } else if (index <= widget.opportunityStages.length) {
                        return _buildListTile(
                            widget.opportunityStages[index - 1]);
                      } else if (index ==
                          (widget.opportunityStages.length + 1)) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
                          child: WidgetInputLabel(
                              label: 'crm.opportunity.stage.lost.result'.tr,
                              isRequired: true),
                        );
                      } else {
                        return _buildOpptageReasonCell(_opportunityStageReasons[
                            index - widget.opportunityStages.length - 2]);
                      }
                    }),
              ),
              WidgetButton(
                title: 'save'.tr,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  if (_opportunityStageReasons.isNotEmpty &&
                      currentStage?.oppStageReason?.id == null) {
                    EasyLoading.showToast(
                        'crm.opportunity.stage.select.lost.empty'.tr);
                    return;
                  }
                  if (currentStage?.id != 6 && currentStage?.id != 7) {
                    EasyLoading.showToast(
                        'crm.opportunity.stage.select.closed.empty'.tr);
                    return;
                  }
                  Get.back();
                  widget.onSaveOpportunityStage(currentStage);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  int getCount() {
    var count = widget.opportunityStages.length + 1;
    if (_opportunityStageReasons.isNotEmpty) {
      count += _opportunityStageReasons.length + 1;
    }
    return count;
  }

  ListTile _buildListTile(OpportunityStage stage) {
    return ListTile(
      onTap: () {
        if (stage.id == currentStage?.id) {
          return;
        }
        setState(() {
          currentStage = stage;
        });
        getStageReason(stage.id ?? 0);
      },
      title: Text(stage.opportunityStageName ?? ''),
      leading: stage.id == currentStage?.id
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

  ListTile _buildOpptageReasonCell(
      OpportunityStageReason opportunityStageReason) {
    return ListTile(
      onTap: () {
        setState(() {
          currentStage?.oppStageReason = opportunityStageReason;
        });
      },
      title: Text(opportunityStageReason.opportunityStageReasonName ?? ''),
      leading: opportunityStageReason.id == currentStage?.oppStageReason?.id
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

  // Lấy danh sách lý đóng cơ hội bán hàng
  Future<void> getStageReason(int opportunityStageId) async {
    if (opportunityStageId != 7) {
      _opportunityStageReasons.clear();
      return;
    }
    try {
      await EasyLoading.show();
      _opportunityStageReasons.clear();
      final data =
          await _crmUIRepository.getOpportunityStageReason(opportunityStageId);
      setState(() {
        _opportunityStageReasons = data.data ?? [];
      });
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    }
  }
}
