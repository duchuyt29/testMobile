import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/crm/widget_content_cell_border.dart';
import '../../../../../../shared/widgets/crm/widget_lead_name.dart';
import '../../../../../../shared/widgets/crm/widget_title_component.dart';
import '../controllers/crm_lead_detail_controllers.dart';

// ignore: must_be_immutable
class CrmLeadDetailScreen extends GetView<CrmLeadDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.details'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.back(result: controller.leadDetail.value);
          return false;
        },
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: _buildBodyContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Obx(() {
          return WidgetLeadName(
            controller.leadDetail.value?.getLeadTitle() ?? '',
            color: controller.leadDetail.value?.isConvert == 1
                ? AppColor.secondaryColor
                : AppColor.primaryTextColor,
          );
        }),
        const SizedBox(height: 5),
        _buildLeadStage(),
        _buildLeadInfo(),
        _buildLeadAddress(),
        _buildAdditionalInfo(),
        Divider(
            height: 15, thickness: 15, color: AppColor.secondBackgroundColor),
        _buildLogs(),
      ],
    );
  }

  Widget _buildLeadStage() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrmWidgetTitleComponent(
            title: 'crm.lead.status'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: (controller.leadDetail.value?.isDone() ?? false)
                ? null
                : controller.onEditStatus,
          ),
          WidgetContentCellBorder('crm.lead.personal.in.charge'.tr,
              controller.leadDetail.value?.getEmplpoyee()?.getFullname() ?? ''),
          WidgetContentCellBorder('crm.lead.stage'.tr,
              controller.leadDetail.value?.getLeadStage()?.leadStageName ?? ''),
          WidgetContentCellBorder(
              'crm.lead.potential.level'.tr,
              controller.leadDetail.value
                      ?.getLeadPotentialLevel()
                      ?.leadPotentialLevelName ??
                  ''),
          WidgetContentCellBorder(
            'crm.activity.begin.day'.tr,
            DateUtil.formatDatetimeToString(
                controller.leadDetail.value?.startDate),
          ),
          WidgetContentCellBorder(
              'crm.lead.refusal.reason'.tr,
              controller.leadDetail.value
                      ?.getLeadStageReason()
                      ?.leadStageReasonName ??
                  ''),
        ],
      );
    });
  }

  Widget _buildLeadInfo() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrmWidgetTitleComponent(
            title: 'crm.lead.infor'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: (controller.leadDetail.value?.isDone() ?? false)
                ? null
                : controller.onEditInfo,
          ),
          WidgetContentCellBorder(
              'fullname'.tr, controller.leadDetail.value?.leadName ?? ''),
          WidgetContentCellBorder('crm.account.gender'.tr,
              controller.leadDetail.value?.getGender()?.genderName ?? ''),
          WidgetContentCellBorder(
            'phone.number'.tr,
            controller.leadDetail.value?.leadPhone ?? '',
            onTapValue: controller.onPhoneAction,
          ),
          WidgetContentCellBorder(
              'crm.contact.title_name'.tr,
              controller.leadDetail.value?.getSalutation()?.salutationName ??
                  ''),
          WidgetContentCellBorder(
              'Email', controller.leadDetail.value?.leadEmail ?? ''),
          WidgetContentCellBorder('crm.contact.position'.tr,
              controller.leadDetail.value?.leadTitle ?? ''),
          WidgetContentCellBorder('crm.lead.company'.tr,
              controller.leadDetail.value?.company ?? ''),
          WidgetContentCellBorder('crm.lead.businessarea'.tr,
              controller.leadDetail.value?.getIndustry()?.industryName ?? ''),
          WidgetContentCellBorder(
              'crm.lead.source'.tr,
              controller.leadDetail.value?.getLeadSource()?.leadSourceName ??
                  ''),
          WidgetContentCellBorder('crm.lead.source.description'.tr,
              controller.leadDetail.value?.sourceDescription ?? ''),
        ],
      );
    });
  }

  Widget _buildLeadAddress() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrmWidgetTitleComponent(
            title: 'crm.account.address'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: (controller.leadDetail.value?.isDone() ?? false)
                ? null
                : controller.onEditAddress,
          ),
          WidgetContentCellBorder('crm.lead.address'.tr,
              controller.leadDetail.value?.getFullAddress() ?? ''),
          WidgetContentCellBorder('crm.lead.zipcode'.tr,
              controller.leadDetail.value?.leadPostalCode ?? ''),
        ],
      );
    });
  }

  Widget _buildAdditionalInfo() {
    return Obx(() {
      return Column(
        children: [
          CrmWidgetTitleComponent(
            title: 'crm.lead.additional'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: (controller.leadDetail.value?.isDone() ?? false)
                ? null
                : controller.onEditAdditionInfo,
          ),
          WidgetContentCellBorder(
            'crm.lead.product.care'.tr,
            controller.leadDetail.value?.getProductsInterest() ?? '',
            onTap: controller.onProductsInterest,
          ),
          WidgetContentCellBorder('crm.lead.descrip'.tr,
              controller.leadDetail.value?.description ?? ''),
        ],
      );
    });
  }

  Widget _buildLogs() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'system.information'.tr,
              style: AppTextStyle.bold(fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('crm.create.by'.tr),
                Text(controller.leadDetail.value?.getCreateLog() ?? ''),
              ],
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('crm.update.by'.tr),
                Text(controller.leadDetail.value?.getUpdateLog() ?? ''),
              ],
            ),
          ),
        ],
      );
    });
  }
}
