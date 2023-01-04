import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controller/crm_edit_lead_info_controller.dart';

class CrmEditLeadInfoScreen extends GetView<CrmEditLeadInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.information.edit'.tr,
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
              title: 'crm.account.fullname'.tr,
              name: 'fullName',
              controller: controller.nameController,
              textInputType: TextInputType.name,
              isRequired: true,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.account.phone.number'.tr,
              name: 'phoneNumber',
              controller: controller.phoneController,
              textInputType: TextInputType.phone,
              isRequired: true,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.account.gender'.tr,
              name: 'gender',
              initialValue: controller.indexGender,
              items: controller.crmMasterData?.listGender
                      ?.map((e) => e.genderName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedGender,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.contact.title_name'.tr,
              name: 'salutation',
              initialValue: controller.indexSalutation,
              items: controller.crmMasterData?.listSalutation
                      ?.map((e) => e.salutationName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSalutation,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.account.email'.tr,
              name: 'email',
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.contact.position'.tr,
              name: 'position',
              controller: controller.positionController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.company'.tr,
              name: 'crm.lead.company'.tr,
              controller: controller.companyController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.account.bussinessfiled'.tr,
              name: 'bussinessfiled',
              initialValue: controller.indexIndustry,
              items: controller.crmMasterData?.listIndustry
                      ?.map((e) => e.industryName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedIndustry,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.lead.source'.tr,
              name: 'crm.lead.source'.tr,
              initialValue: controller.indexSource,
              items: controller.crmMasterData?.leadSources
                      ?.map((e) => e.leadSourceName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedSource,
              isRequired: true,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.source.description'.tr,
              name: 'crm.lead.source.description'.tr,
              controller: controller.sourceDescriptionController,
              textInputType: TextInputType.text,
              maxLines: 4,
            ),
            // build single choice dialog
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
