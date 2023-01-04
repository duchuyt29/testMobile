import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controllers/account_document_form_controllers.dart';

class AccountDocumentFormPage extends GetView<AccountDocumentFormController> {
  AccountDocumentFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.documentId == null
              ? controller.accountInfo.value?.accountTypeId == 1
                  ? 'crm.account.identification.add'.tr
                  : 'crm.account.info_company.add'.tr
              : controller.accountInfo.value?.accountTypeId == 1
                  ? 'crm.account.identification.edit'.tr
                  : 'crm.account.info_company.edit'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildFormContent(),
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
                controller.onSubmit();
              },
              child: Text(
                controller.accountInfo.value?.id != null
                    ? 'save'.tr
                    : 'crm.contact.next'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
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
                children: [
                  const SizedBox(height: 10),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.account.kind.of.papers'.tr,
                        text: controller.selectedType.value?.documentTypeName ??
                            '',
                        onPress: controller.loadType,
                        isRequired: true,
                      )),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.number.of.papers'.tr,
                    name: 'numberOfPaper',
                    controller: controller.documentNumberController,
                    textInputType: TextInputType.number,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.account.date.range'.tr,
                    controller: controller.issueDateController,
                    selectDate: controller.selectDate,
                    isRequired: false,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'crm.account.place'.tr,
                      name: 'place',
                      controller: controller.issuePlaceController,
                      textInputType: TextInputType.name),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'crm.account.note'.tr,
                      name: 'note',
                      controller: controller.noteController,
                      textInputType: TextInputType.name),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }
}
