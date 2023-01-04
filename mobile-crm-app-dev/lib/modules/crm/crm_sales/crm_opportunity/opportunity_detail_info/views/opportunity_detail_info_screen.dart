import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_title_component.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/opportunity_detail_info_controller.dart';

class OpportunityDetailInfoScreen
    extends GetView<OpportunityDetailInfoController> {
  const OpportunityDetailInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'crm.quote.detail'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
          ),
          actions: [
            // CrmWidgetButton(
            //   bgColor: Colors.orangeAccent,
            //   icon: const Icon(
            //     Icons.phone_callback_rounded,
            //     color: Colors.white,
            //     size: 18,
            //   ),
            //   onTap: controller.showCreateActivityModalBottomSheet,
            // ),
            // const SizedBox(width: 10),
            Obx(
              () => controller.opportunityInfo.value?.isOpportunityClose() ??
                      false
                  ? const SizedBox.shrink()
                  : Visibility(
                      visible: AppDataGlobal
                              .userConfig
                              ?.menuActions
                              ?.crmServiceSaleManagementSaleOpporturnityInfo
                              ?.delete !=
                          null,
                      child: CrmWidgetButton(
                        bgColor: Colors.red,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 18,
                        ),
                        onTap: () => controller.showDeleteModalBottomSheet(
                            controller.opportunityInfo.value!.id ?? 0),
                      ),
                    ),
            ),
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
        ));
  }

  Column _buildBodyContent() {
    return Column(
      children: [
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
                  '${controller.opportunityInfo.value?.opportunityName ?? ''} - ${controller.opportunityInfo.value?.opportunityCode ?? ''}',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        CrmWidgetTitleComponent(
          title: 'crm.opportunity.status.info'.tr,
          titleAction: 'crm.account.edit'.tr,
          onTap:
              (controller.opportunityInfo.value?.isOpportunityClose() ?? true)
                  ? null
                  : AppDataGlobal
                              .userConfig
                              ?.menuActions
                              ?.crmServiceSaleManagementSaleOpporturnityInfo
                              ?.update !=
                          null
                      ? controller.onViewStatusInfoForm
                      : null,
        ),
        _buildListItemOppStatusInformation(),
        CrmWidgetTitleComponent(
          title: 'crm.opportunity.info'.tr,
          titleAction: 'crm.account.edit'.tr,
          onTap:
              (controller.opportunityInfo.value?.isOpportunityClose() ?? true)
                  ? null
                  : AppDataGlobal
                              .userConfig
                              ?.menuActions
                              ?.crmServiceSaleManagementSaleOpporturnityInfo
                              ?.update !=
                          null
                      ? controller.onViewInfoForm
                      : null,
        ),
        _buildListItemOppInformation(),
        CrmWidgetTitleComponent(
          title: 'crm.lead.additional'.tr,
          titleAction: 'crm.account.edit'.tr,
          onTap:
              (controller.opportunityInfo.value?.isOpportunityClose() ?? true)
                  ? null
                  : AppDataGlobal
                              .userConfig
                              ?.menuActions
                              ?.crmServiceSaleManagementSaleOpporturnityInfo
                              ?.update !=
                          null
                      ? controller.onViewAdditionalForm
                      : null,
        ),
        _buildListItemOppAdditionalInformation(),
        Container(
          height: 10,
          color: Colors.grey.shade100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                'Thông tin hệ thống',
                style: AppTextStyle.bold(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${'crm.create.by'.tr}:'),
                  Text(controller.opportunityInfo.value?.getCreateAtContent() ??
                      ''),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${'crm.update.by'.tr}:'),
                  Text(controller.opportunityInfo.value?.getUpdateAtContent() ??
                      ''),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ],
    );
  }

  Container _buildListItemOppStatusInformation() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemField(
            label: 'crm.lead.personal.in.charge'.tr,
            value:
                controller.opportunityInfo.value?.getEmployeeFullName() ?? '',
          ),
          _buildItemField(
            label: 'crm.opportunity.stage'.tr,
            value: controller.opportunityInfo.value?.getStageName() ?? '',
          ),
          _buildItemField(
            label: 'crm.activity.begin.day'.tr,
            value: DateUtil.formatDatetimeToString(
                controller.opportunityInfo.value?.startDate),
          ),
          _buildItemField(
            label: 'crm.close.date'.tr,
            value: DateUtil.formatDatetimeToString(
                controller.opportunityInfo.value?.closeDate),
          ),
          _buildItemField(
              label: 'crm.opportunity.reason'.tr,
              value: controller
                      .opportunityInfo.value?.opportunityStageReasonName ??
                  ''),
        ],
      ),
    );
  }

  Container _buildListItemOppInformation() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemField(
            label: 'crm.opportunity.name'.tr,
            value: controller.opportunityInfo.value?.opportunityName ?? '',
          ),
          _buildItemField(
            label: 'crm.customer'.tr,
            value: controller.opportunityInfo.value?.accountName ?? '',
            isActionText: true,
          ),
          _buildItemField(
            label: 'crm.opportunity.type'.tr,
            value: controller.opportunityInfo.value?.opportunityTypeName ?? '',
          ),
          _buildItemField(
            label: 'crm.opportunity.lead.source'.tr,
            value: controller.opportunityInfo.value?.leadSourceName ?? '',
          ),
          _buildItemField(
            label: 'crm.opportunity.probability'.tr,
            value:
                controller.opportunityInfo.value?.getProbabilityString() ?? '',
          ),
          _buildItemField(
            label: 'crm.opportunity.currency'.tr,
            value: controller.opportunityInfo.value?.getCurrencyName() ?? '',
          ),
          _buildItemField(
            label: 'crm.opportunity.amount'.tr,
            value: controller.opportunityInfo.value?.getAmount() ?? '',
          ),
        ],
      ),
    );
  }

  Container _buildListItemOppAdditionalInformation() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemField(
            label: 'crm.product.product.desc'.tr,
            value: controller.opportunityInfo.value?.description ?? '',
          ),
        ],
      ),
    );
  }

  Container _buildItemField({
    required String label,
    required String value,
    bool isActionText = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
              flex: 3,
              child: Text(value,
                  style: TextStyle(
                    color: isActionText ? Colors.blue : Colors.black,
                  )))
        ],
      ),
    );
  }
}
