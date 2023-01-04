import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/response/opporunity/opportunity_stage_reason_response.dart';

import '../../constants/colors.dart';

class WidgetCrmOppStageReason extends StatefulWidget {
  final List<OpportunityStageReason> opportunityStagesReason;

  final Function(OpportunityStageReason?) onSaveOpportunityStage;

  const WidgetCrmOppStageReason({
    Key? key,
    required this.opportunityStagesReason,
    required this.onSaveOpportunityStage,
  }) : super(key: key);

  @override
  State<WidgetCrmOppStageReason> createState() =>
      _WidgetCrmOppStageReasonState();
}

class _WidgetCrmOppStageReasonState extends State<WidgetCrmOppStageReason> {
  OpportunityStageReason? currentStage;

  @override
  void initState() {
    super.initState();
    // currentStage =
    //     widget.currentOpportunityStage ?? widget.opportunityStages.first;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.opportunityStagesReason.length,
      itemBuilder: (context, index) =>
          _buildListTile(widget.opportunityStagesReason[index]),
    );
  }

  ListTile _buildListTile(OpportunityStageReason stage) {
    return ListTile(
      onTap: () {
        setState(() {
          currentStage = stage;
        });
        widget.onSaveOpportunityStage(currentStage);
        Get.back();
      },
      title: Text(stage.opportunityStageReasonName ?? ''),
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
}
