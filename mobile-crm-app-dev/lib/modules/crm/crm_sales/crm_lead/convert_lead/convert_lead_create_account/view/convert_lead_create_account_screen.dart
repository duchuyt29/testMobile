import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';

import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controller/convert_lead_create_account_controller.dart';

class CrmConvertLeadCreateAccountScreen
    extends GetView<CrmConvertLeadCreateAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.create.new'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Container _buildBodyContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          FormBuilder(
            key: controller.fbKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Obx(() {
                  return CrmWidgetBuildCombobox(
                    title: 'crm.account.customertype'.tr,
                    name: 'crm.account.customertype',
                    initialValue: controller.indexAccountType.value,
                    items: controller.crmMasterData?.listAccountType
                            ?.map((e) => e.accountTypeName ?? '')
                            .toList() ??
                        [],
                    onChanged: controller.onSelectedAccountType,
                    isRequired: true,
                  );
                }),
                const SizedBox(height: 10),
                CrmWidgetBuildFormTextField(
                  title: 'crm.account.customer'.tr,
                  name: 'crm.account.customer',
                  controller: controller.nameController,
                  textInputType: TextInputType.text,
                  isRequired: true,
                ),
                const SizedBox(height: 10),
                Obx(() {
                  final accountType = controller.crmMasterData
                      ?.listAccountType?[controller.indexAccountType.value];
                  return CrmWidgetBuildFormTextField(
                    title: 'phone.number'.tr,
                    name: 'phone.number',
                    controller: controller.phoneController,
                    textInputType: TextInputType.phone,
                    isRequired: true,
                    disable: accountType?.id == 1,
                  );
                }),
                const SizedBox(height: 10),
                Obx(() {
                  return CrmWidgetBuildCombobox(
                    title: 'crm.account.kind.of.papers'.tr,
                    name: 'crm.account.kind.of.papers',
                    initialValue: controller.indexDocumentType.value,
                    items: controller.documentTypes
                        .map((e) => e.documentTypeName ?? '')
                        .toList(),
                    onChanged: controller.onSelectedDocmentType,
                    isRequired: true,
                  );
                }),
                const SizedBox(height: 10),
                CrmWidgetBuildFormTextField(
                  title: 'crm.account.number.of.papers'.tr,
                  name: 'crm.account.number.of.papers',
                  controller: controller.documentController,
                  textInputType: TextInputType.text,
                  isRequired: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: WidgetButton(
                title: 'cancel'.tr,
                textButtonColor: AppColor.primaryButtonColor,
                backgroundButtonColor: AppColor.primaryBackgroundColor,
                onPressed: controller.onCancel,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetButton(
                title: 'save'.tr,
                onPressed: controller.onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
