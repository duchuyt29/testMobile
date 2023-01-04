import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';

import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';

import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';

import '../controllers/crm_create_detail_lead_sales_party_involes_controllers.dart';

class CrmCreateDetailLeadSalePartyInvolesPage
    extends GetView<CrmCreateDetailLeadSalePartyInvolesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.leadPartyInvolved?.id == null
              ? 'crm.contact.involve.add'.tr
              : 'crm.contact.involve.edit'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 1,
          color: const Color.fromARGB(255, 227, 227, 227),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: _buildFormContent(),
        ),
      ],
    );
  }

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          FormBuilder(
              key: controller.fbKey,
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.contact.involve.subject'.tr,
                    name: 'nhansu',
                    controller: controller.typeController,
                    textInputType: TextInputType.name,
                    disable: true,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.account.name'.tr,
                        text: controller.name.value,
                        disable: controller.leadPartyInvolved?.id != null,
                        onPress: controller.leadPartyInvolved?.id == null
                            ? controller.loadEmployee
                            : () {},
                        isRequired: true,
                      )),
                  const SizedBox(height: 10),
                  CrmWidgetBuildCombobox(
                    title: 'crm.account.personal.role'.tr,
                    name: 'personalRole',
                    initialValue: controller.indexRole,
                    items: controller
                            .crmMasterData?.listPartyInvolvedPartnerFunction
                            ?.map(
                                (e) => e.partyInvolvedPartnerFunctionName ?? '')
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.selectRole(value);
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: Get.back,
              child: Text(
                'crm.contact.cancel'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                primary: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                controller.onSubmitted();
              },
              child: Text(
                'save'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
