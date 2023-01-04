import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controller/crm_edit_lead_addition_info_controller.dart';

class CrmEditLeadAdditionInfoScreen
    extends GetView<CrmEditLeadAdditionInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.addition.information'.tr,
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
      child: Column(
        children: [
          // Obx(
          //   () => CrmWidgetFormLabelBox(
          //     label: 'crm.lead.refusal.reason'.tr,
          //     text: controller
          //             .selcetedLeadStageReason.value?.leadStageReasonName ??
          //         '',
          //     onPress: controller.onChangeLeadStageReason,
          //   ),
          // ),
          // const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.lead.descrip'.tr,
            name: 'description',
            controller: controller.descriptionController,
            textInputType: TextInputType.text,
            maxLines: 4,
          ),
        ],
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
