import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../controllers/crm_lead_filter_controllers.dart';

class CrmLeadFilterScreen extends GetView<CrmLeadFilterController> {
  const CrmLeadFilterScreen({Key? key}) : super(key: key);

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
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.personal.in.charge'.tr,
                      text: controller.filter.value.getEmployeeInCharge(),
                      onPress: controller.onEmployeeInCharge,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.lead.potential.level'.tr,
                      text: controller.filter.value.getLeadPotentialLevel(),
                      onPress: controller.onLeadPotentialLevel,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.lead.source'.tr,
                      text: controller.filter.value.getLeadSource(),
                      onPress: controller.onSource,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.lead.status'.tr,
                      text: controller.filter.value.getLeadStage(),
                      onPress: controller.onLeadStage,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.lead.product.care'.tr,
                      text: controller.filter.value.getLeadProduct(),
                      onPress: controller.onLeadProduct,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.lead.filter.start.date'.tr,
                    controller: controller.fromDateController,
                    selectDate: () => controller.selectFromDate(),
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.lead.filter.end.date'.tr,
                    controller: controller.toDateController,
                    selectDate: () => controller.selectToDate(),
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
              child: WidgetButton(
                title: 'crm.filter.remove'.tr,
                textButtonColor: AppColor.primaryButtonColor,
                backgroundButtonColor: AppColor.primaryBackgroundColor,
                onPressed: controller.onClear,
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
