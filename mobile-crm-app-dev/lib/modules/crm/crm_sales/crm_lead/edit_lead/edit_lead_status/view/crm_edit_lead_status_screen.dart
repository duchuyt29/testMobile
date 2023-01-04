import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controller/crm_edit_lead_status_controller.dart';

class CrmEditLeadStatusScreen extends GetView<CrmEditLeadStatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.edit.status'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: _buildBodyContent(),
      ),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: FormBuilder(
        key: controller.fbKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.personal.in.charge'.tr,
              name: 'employeeInCharge',
              controller: controller.employeeInChargeController,
              textInputType: TextInputType.text,
              isRequired: true,
              disable: true,
            ),
            const SizedBox(height: 10),
            Obx(() {
              return CrmWidgetBuildCombobox(
                title: 'crm.lead.status'.tr,
                name: 'leadStage',
                initialValue: controller.indexLeadStage,
                isRequired: true,
                disable: controller.isDone.value,
                items: controller.crmMasterData?.listLeadStage
                        ?.map((e) => e.leadStageName ?? '')
                        .toList() ??
                    [],
                onChanged: controller.onSelectedLeadStatus,
              );
            }),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.lead.potential.level'.tr,
              name: 'potenitalLevel',
              initialValue: controller.indexPotenitalLevel,
              items: controller.crmMasterData?.listLeadPotentialLevel
                      ?.map((e) => e.leadPotentialLevelName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedPotenitalLevel,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormDateField(
              title: 'crm.lead.startdate'.tr,
              controller: controller.startDateController,
              selectDate: () => controller.selectStartDate(),
            ),
            const SizedBox(height: 10),
            Obx(
              () => CrmWidgetFormLabelBox(
                label: 'crm.lead.refusal.reason'.tr,
                text: controller
                        .selcetedLeadStageReason.value?.leadStageReasonName ??
                    '',
                isRequired: controller.isRequiredLeadStageReason.value,
                onPress: controller.onChangeLeadStageReason,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 55,
                child: TextButton(
                  onPressed: controller.onCancel,
                  child: Text(
                    'cancel'.tr,
                    style: AppTextStyle.heavy(
                      color: AppColor.primaryButtonColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetButton(
                title: 'save'.tr,
                onPressed: controller.onUpdate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
