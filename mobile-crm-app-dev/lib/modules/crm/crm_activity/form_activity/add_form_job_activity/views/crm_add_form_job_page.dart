import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_contact.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_add_form_job_controller.dart';

class CrmAddFormJobPage extends GetView<CrmAddFormJobController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              controller.isEdit.value
                  ? 'crm.activity.edit.job'.tr
                  : 'crm.activity.new.job'.tr,
              style: AppTextStyle.heavy(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Obx(
            _buildBodyContent,
          ),
        ),
        bottomNavigationBar: _buildButtonSave(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              _buildFormContent(),
              const SizedBox(height: 15),
            ],
          )),
        ),
      ],
    );
  }

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          FormBuilder(
              key: controller.fbKey,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.activity.topic'.tr,
                    name: 'topic',
                    controller: controller.topic,
                    textInputType: TextInputType.text,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildCombobox(
                    title: 'crm.activity.priority.level'.tr,
                    name: 'priorityLevel',
                    items: AppDataGlobal.crmMasterData?.listPriority
                            ?.map((e) => e.priorityName ?? '')
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.priorityId = AppDataGlobal
                              .crmMasterData?.listPriority?[value].id ??
                          0;
                    },
                    initialValue: controller.isEdit.value
                        ? controller.priorityId - 1
                        : null,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildCombobox(
                    title: 'crm.activity.belonged'.tr,
                    name: 'thuocVe',
                    items: CommonConstants.tasksObject,
                    onChanged: (value) {
                      if (controller.objectTypeId != value + 2) {
                        controller.name.value = '';
                        controller.accountId = 0;
                        controller.leadId = 0;
                        controller.opportunityId = 0;
                        controller.quoteId = 0;
                        controller.contractId = 0;
                        controller.orderId = 0;
                        controller.activityContact.value = ActivityContact();
                        controller.contactId = 0;
                        controller.objectTypeId = value + 2;
                      }
                    },
                    initialValue: Get.arguments != null
                        ? controller.isEdit.value
                            ? controller.objectTypeId - 2
                            : controller.objectTypeId
                        : null,
                    isRequired: true,
                    disable: controller.isHaveData.value &&
                        controller.isEdit.value == false,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetFormLabelBox(
                    label: 'crm.activity.name'.tr,
                    text: controller.name.value,
                    onPress: controller.loadActivityName,
                    isRequired: true,
                    disable: controller.isHaveData.value &&
                        controller.isEdit.value == false,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.activity.begin.day'.tr,
                    controller: controller.dateStartText,
                    selectDate: () =>
                        controller.selectDate(controller.dateStartText, true),
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildFormDateField(
                    title: 'crm.activity.completion'.tr,
                    controller: controller.deadlineText,
                    selectDate: () =>
                        controller.selectDate(controller.deadlineText, false),
                    isRequired: true,
                  ),
                  // const SizedBox(height: 15),
                  // CrmWidgetBuildFormDateField(
                  //   enable: false,
                  //   title: 'crm.activity.success.day'.tr,
                  //   controller: controller.deadlineText,
                  //   selectDate: () =>
                  //       controller.selectDate(controller.deadlineText, false),
                  //   isRequired: false,
                  // ),
                  const SizedBox(height: 15),
                  CrmWidgetBuildCombobox(
                    title: 'crm.activity.type.of.work'.tr,
                    name: 'typeofwork',
                    items: AppDataGlobal.crmMasterData?.taskType
                            ?.map((e) => e.taskTypeName ?? '')
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.takeTypeId =
                          AppDataGlobal.crmMasterData?.taskType?[value].id ?? 0;
                    },
                    initialValue: controller.isEdit.value
                        ? controller.takeTypeId != 0
                            ? controller.takeTypeId - 1
                            : null
                        : null,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetFormLabelBox(
                    label: 'crm.activity.requester'.tr,
                    text: controller.requester.value.getFullname(),
                    onPress: controller.loadRequesterEmployee,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetFormLabelBox(
                    label: 'crm.activity.contact'.tr,
                    text: controller.activityContact.value.contactName ?? '',
                    onPress: controller.loadActivityContact,
                  ),
                  const SizedBox(height: 15),
                  CrmWidgetFormLabelBox(
                    label: 'crm.activity.responsible'.tr,
                    text: controller.responsiableText.value,
                    onPress: controller.loadResponsibleEmployee,
                  ),
                  const SizedBox(height: 15),
                  _buildProductDescriptionInput(
                      title: 'crm.account.des'.tr,
                      name: 'description',
                      controller: controller.note,
                      textInputType: TextInputType.text,
                      isRequired: false),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

  Widget _buildProductDescriptionInput({
    required String title,
    required String name,
    required TextEditingController? controller,
    required TextInputType textInputType,
    required bool isRequired,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: title,
            )),
        FormBuilderTextField(
          name: name,
          controller: controller,
          keyboardType: textInputType,
          maxLines: 3,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: FormBuilderValidators.compose([
            if (isRequired)
              FormBuilderValidators.required(
                  errorText: 'crm.validation.required'.tr),
          ]),
        ),
      ],
    );
  }
}
