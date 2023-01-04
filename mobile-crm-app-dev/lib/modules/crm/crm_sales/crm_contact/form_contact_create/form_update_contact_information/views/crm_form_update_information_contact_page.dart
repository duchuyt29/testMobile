import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_form_update_information_contact_controllers.dart';

class CrmFromUpdateInformationContactPage
    extends GetView<CrmFromUpdateInformationContactController> {
  const CrmFromUpdateInformationContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.contact.edit'.tr,
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
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            _buildFormContent(),
          ],
        ),
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

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(
        bottom: Get.context!.mediaQueryViewInsets.bottom + 60,
      ),
      child: Column(
        children: [
          FormBuilder(
              key: controller.fbKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.fullname'.tr,
                    name: 'fullName',
                    controller: controller.nameController,
                    textInputType: TextInputType.name,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildCombobox(
                    title: 'crm.contact.title_name'.tr,
                    name: 'customertype',
                    initialValue: controller.indexSalutation,
                    isRequired: true,
                    items: controller.crmMasterData?.listSalutation
                            ?.map((e) => e.salutationName ?? '')
                            .toList() ??
                        [],
                    onChanged: (index) {
                      controller.selectSalutation(index);
                    },
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.contact.phone.number'.tr,
                    name: 'phoneNumber',
                    controller: controller.phoneController,
                    textInputType: TextInputType.phone,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'Email',
                      name: 'email',
                      controller: controller.emailController,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 10),
                  CrmWidgetBuildCombobox(
                    title: 'crm.contact.gender'.tr,
                    name: 'customertype',
                    initialValue: controller.indexGender,
                    isRequired: true,
                    items: controller.crmMasterData?.listGender
                            ?.map((e) => e.genderName ?? '')
                            .toList() ??
                        [],
                    onChanged: (index) {
                      controller.selectGender(index);
                    },
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'crm.contact.position'.tr,
                      name: 'chuvu',
                      controller: controller.titleController,
                      textInputType: TextInputType.name),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.contact.owner_employee'.tr,
                    name: 'nhansu',
                    controller: controller.employeeController,
                    textInputType: TextInputType.name,
                    disable: true,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  _buildDescriptionInput(),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildDescriptionInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.account.des'.tr,
            )),
        FormBuilderTextField(
          name: 'accountDes',
          controller: controller.noteController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          maxLines: 3,
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
        ),
      ],
    );
  }
}
