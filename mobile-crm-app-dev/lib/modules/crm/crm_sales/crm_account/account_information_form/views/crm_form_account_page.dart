import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../shared/constants/colors.dart';
import '../controllers/crm_form_account_controllers.dart';

class CrmCreateFormAccountPage extends GetView<CrmCreateFormAccountController> {
  const CrmCreateFormAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.accountInfo.value.id != null
              ? 'crm.account.create.edit'.tr
              : 'crm.account.create.new'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFormContent(),
              _buildButtonSave(),
            ],
          ),
        ))
      ],
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                controller.accountInfo.value.id != null
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                CrmWidgetBuildFormTextField(
                  title: controller.accountInfo.value.accountTypeId == 1
                      ? 'crm.account.fullname'.tr
                      : 'crm.account.fullname_company'.tr,
                  name: 'fullName',
                  controller: controller.name,
                  textInputType: TextInputType.name,
                  isRequired: true,
                ),
                const SizedBox(height: 10),
                CrmWidgetBuildCombobox(
                  title: 'crm.account.customertype'.tr,
                  name: 'customertype',
                  initialValue: controller.indexAccountType,
                  disable: true,
                  isRequired: true,
                  items: controller.crmMasterData?.listAccountType
                          ?.map((e) => e.accountTypeName ?? '')
                          .toList() ??
                      [],
                  onChanged: (index) {},
                ),
                const SizedBox(height: 10),
                CrmWidgetBuildFormTextField(
                  title: 'crm.account.phone.number'.tr,
                  name: 'phoneNumber',
                  controller: controller.phone,
                  textInputType: TextInputType.number,
                  isRequired: true,
                ),
                const SizedBox(height: 10),
                CrmWidgetBuildFormTextField(
                    title: 'crm.account.email'.tr,
                    name: 'email',
                    controller: controller.email,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                Visibility(
                  visible: controller.accountInfo.value.accountTypeId == 1,
                  child: CrmWidgetBuildCombobox(
                    title: 'crm.account.gender'.tr,
                    name: 'gender',
                    initialValue: controller.indexGender,
                    isRequired: false,
                    items: controller.crmMasterData?.listGender
                            ?.map((e) => e.genderName ?? '')
                            .toList() ??
                        [],
                    onChanged: (index) {
                      controller.selectGender(index);
                    },
                  ),
                ),
                Visibility(
                  visible: controller.accountInfo.value.accountTypeId == 2,
                  child: CrmWidgetBuildFormTextField(
                    title: '${'crm.account.phone.number'.tr} 1',
                    name: 'phoneNumber',
                    controller: controller.phone1,
                    textInputType: TextInputType.number,
                    isRequired: false,
                  ),
                ),
                const SizedBox(height: 10),
                CrmWidgetBuildCombobox(
                  title: 'crm.account.bussinessfiled'.tr,
                  name: 'bussinessfiled',
                  initialValue: controller.indexIndustry,
                  isRequired: true,
                  items: controller.crmMasterData?.listIndustry
                          ?.map((e) => e.industryName ?? '')
                          .toList() ??
                      [],
                  onChanged: (index) {
                    controller.selectIndustry(index);
                  },
                ),

                Visibility(
                  visible: controller.accountInfo.value.accountTypeId != 1,
                  child: Obx(() => Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CrmWidgetFormLabelBox(
                          label: 'crm.account.parent.level'.tr,
                          text: controller.parentName.value,
                          onPress: controller.loadParentAccount,
                          isRequired: false,
                        ),
                      )),
                ),
                const SizedBox(height: 10),
                CrmWidgetFormLabelBox(
                  label: 'crm.account.personal.in.charge'.tr,
                  text: controller.ownerEmployee,
                  showIcon: false,
                  disable: true,
                ),
                const SizedBox(height: 10),
                CrmWidgetBuildFormTextField(
                    title: 'crm.account.des'.tr,
                    name: 'description',
                    controller: controller.note,
                    textInputType: TextInputType.name),
                const SizedBox(height: 10),
                // build single choice dialog
              ],
            ),
          )
        ],
      ),
    );
  }
}
