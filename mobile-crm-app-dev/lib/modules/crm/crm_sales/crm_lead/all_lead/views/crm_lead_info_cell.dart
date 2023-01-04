import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_stage.dart';
import 'package:ui_api/crm_api/models/lead/lead_model.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';

class CrmLeadInfoCell extends StatelessWidget {
  final GestureTapCallback? onTap;
  final GestureTapCallback? onPhoneTap;
  final VoidCallback onAddAction;
  final VoidCallback onDelete;
  final VoidCallback onConvert;

  final LeadModel? lead;

  const CrmLeadInfoCell(
      {Key? key,
      this.onTap,
      this.onPhoneTap,
      required this.onAddAction,
      required this.onDelete,
      required this.onConvert,
      required this.lead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleActivity?.createTask !=
                null,
            child: SlidableAction(
              onPressed: (context) => onAddAction(),
              backgroundColor: const Color(0xffF3983E),
              foregroundColor: Colors.white,
              icon: Icons.phone_in_talk,
              //label: 'Save',
            ),
          ),
          if (lead?.isConvert != 1)
            SlidableAction(
              onPressed: (context) => onDelete(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              //label: 'Save',
            ),
          if (lead?.leadStageId == LeadStage.leadDoneConvert &&
              lead?.isConvert != 1)
            SlidableAction(
              onPressed: (context) => onConvert(),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              icon: Icons.change_circle,
              //label: 'Save',
            ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lead?.leadName ?? '',
                style: AppTextStyle.heavy(
                    color: lead?.isConvert == 1
                        ? AppColor.secondaryColor
                        : AppColor.primaryTextColor),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text('crm.code'.tr),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(lead?.leadCode ?? ''),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Text('crm.lead.potential.level'.tr),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(lead?.leadPotentialLevelName ?? ''),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text('phone.number'.tr),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: onPhoneTap,
                        child: Text(
                          lead?.leadPhone ?? '',
                          style: AppTextStyle.regular(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text('crm.lead.email'.tr),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(lead?.leadEmail ?? ''),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text('crm.lead.personal.in.charge'.tr),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(lead?.getEmplpoyeeFullname() ?? ''),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
