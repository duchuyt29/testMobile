import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../controllers/crm_opportunity_filter_controller.dart';

class OpportunityFilterScreen extends GetView<OpportunityFilterController> {
  const OpportunityFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.filter'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
      bottomNavigationBar: _buildButtonFilter(),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.personal.in.charge'.tr,
                      text: controller.filter.value.getEmployeeInCharge(),
                      onPress: controller.onEmployeeInCharge,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.opportunity.stage'.tr,
                      text: controller.filter.value.getStageName() ?? '',
                      onPress: controller.onOpportunityStage,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.customer'.tr,
                      text: controller.filter.value.getAccountName() ?? '',
                      onPress: controller.onAccount,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.lead.product.care'.tr,
                      text: controller.filter.value.getProductNames() ?? '',
                      onPress: controller.onLeadProduct,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.opportunity.currency'.tr,
                      text: controller.filter.value.getCurrenciesName(),
                      onPress: controller.onCurrency,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.lead.source'.tr,
                      text: controller.filter.value.getLeadSourceName() ?? '',
                      onPress: controller.onSource,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.filter.on.start.date'.tr,
                    controller: controller.fromDateController,
                    selectDate: () => controller.selectFromDate(),
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.filter.at.start.date'.tr,
                    controller: controller.toDateController,
                    selectDate: () => controller.selectToDate(),
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.filter.at.start.close.date'.tr,
                    controller: controller.fromStartDateController,
                    selectDate: () => controller.selectFromStartDate(),
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.filter.on.start.close.date'.tr,
                    controller: controller.toStartDateController,
                    selectDate: () => controller.selectToStartDate(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonFilter() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: controller.onClear,
                child: Text(
                  'crm.filter.remove'.tr,
                  style: AppTextStyle.regular(
                      fontSize: 18, color: AppColor.primaryColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetButton(
                title: 'crm.contact.apply'.tr,
                onPressed: controller.onSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
