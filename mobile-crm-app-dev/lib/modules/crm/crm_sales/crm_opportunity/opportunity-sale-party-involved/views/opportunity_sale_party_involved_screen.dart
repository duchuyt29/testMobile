import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_sale_party_involved.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/opportunity_sale_party_involved_controller.dart';

class OpportunitySalePartyInvolvedScreen
    extends GetView<OpportunitySalePartyInvolvedController> {
  const OpportunitySalePartyInvolvedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.opportunity.sale_party_involved'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          Obx(() => controller.opportunity.value.isOpportunityClose()
              ? Container()
              : Visibility(
                  visible: AppDataGlobal
                          .userConfig
                          ?.menuActions
                          ?.crmServiceSaleManagementSaleOpporturnityPartyInvolved
                          ?.create !=
                      null,
                  child: CrmWidgetButton(
                    bgColor: Colors.blue,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    onTap: controller.showCreateModalBottomSheet,
                  ),
                )),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Obx(
          () => SingleChildScrollView(
            child: _buildBodyContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(children: [
      Container(
        color: const Color.fromARGB(255, 245, 244, 244),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        margin: const EdgeInsets.only(bottom: 5),
        child: ListTile(
          leading: FCoreImage(
            ImageConstants.crmOpp,
            width: 45,
            height: 45,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'crm.opportunity'.tr,
                style: AppTextStyle.heavy(fontSize: 15),
              ),
              Text(
                '${controller.opportunity.value.opportunityName ?? ''} - ${controller.opportunity.value.opportunityCode ?? ''}',
                style: AppTextStyle.bold(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      ...controller.oppSalePartyInvolved
          .map((item) => _buildListItem(salePartyInvolved: item))
          .toList(),
    ]);
  }

  Widget _buildListItem({
    required OppSalePartyInvolved salePartyInvolved,
  }) {
    return CrmWidgetSlidable(
      endActions: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Visibility(
            visible: AppDataGlobal
                    .userConfig
                    ?.menuActions
                    ?.crmServiceSaleManagementSaleOpporturnityPartyInvolved
                    ?.update !=
                null,
            child: SlidableAction(
              onPressed: (context) {
                controller.opportunity.value.isOpportunityClose()
                    ? null
                    : controller.onViewUpdate(salePartyInvolved);
              },
              backgroundColor: controller.opportunity.value.isOpportunityClose()
                  ? Colors.grey
                  : Colors.orangeAccent,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Chỉnh sửa',
            ),
          ),
          salePartyInvolved.isMain != 1
              ? Visibility(
                  visible: AppDataGlobal
                          .userConfig
                          ?.menuActions
                          ?.crmServiceSaleManagementSaleOpporturnityPartyInvolved
                          ?.delete !=
                      null,
                  child: SlidableAction(
                    onPressed: (context) {
                      controller.opportunity.value.isOpportunityClose()
                          ? null
                          : controller.onDeleteOpportunitySalePartyInvolved(
                              salePartyInvolved.id!);
                    },
                    backgroundColor:
                        controller.opportunity.value.isOpportunityClose()
                            ? Colors.grey
                            : Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Xóa',
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  salePartyInvolved.isMain == 1
                      ? FCoreImage(
                          ImageConstants.workplaceWorkgrouppersonnelInCharge,
                          height: 40)
                      : FCoreImage(
                          ImageConstants.workplaceWorkgrouprelevantPersonal,
                          height: 40),
                  const SizedBox(width: 10),
                  Text(
                    salePartyInvolved.getEmployeeFullName(),
                    style: AppTextStyle.bold(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text('${'crm.account.personal.role'.tr}:')),
                  Expanded(
                      flex: 2,
                      child: Text(
                          salePartyInvolved.getInvolvedPartnerFunctionName()))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                          '${'crm.opportunity.sale_party_involved.name'.tr}:')),
                  Expanded(
                      flex: 2,
                      child: Text(salePartyInvolved.employeeTitleName ?? ''))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
