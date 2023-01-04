import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/opportunity_status_info_form_controller.dart';

class OpportunityStatusInfoFormScreen
    extends GetView<OpportunityStatusInfoFormController> {
  const OpportunityStatusInfoFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.opportunity.status.info.edit'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(top: false, child: Obx(_buildBodyContent)),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [Expanded(child: _buildFormContent()), _buildButtonSave()],
    );
  }

  Widget _buildFormContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FormBuilder(
          key: controller.fbKey,
          child: Column(
            children: [
              _buildEmployee(),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: WidgetInputLabel(
                        label: 'crm.opportunity.stage'.tr,
                        isRequired: true,
                      )),
                  _buildDropdown(
                      name: 'stageId',
                      initialValue:
                          controller.opportunityInfo.value?.opportunityStageId,
                      onChanged: controller.onChangeStage,
                      isRequired: true,
                      items: controller.crmMasterData!.listOpportunityStage!
                          .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.opportunityStageName!)))
                          .toList()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _buildSelectDate(
                  name: 'startDate',
                  label: 'crm.activity.begin.day'.tr,
                  isRequired: true,
                  isReadOnly: true,
                  onTap: () {
                    controller.selectDate(
                      'startDate',
                      true,
                    );
                  },
                  initialValue:
                      controller.opportunityInfo.value?.startDate != null
                          ? DateUtil.formatDatetimeToString(
                              controller.opportunityInfo.value!.startDate!)
                          : ''),
              const SizedBox(
                height: 10,
              ),
              _buildSelectDate(
                  name: 'closeDate',
                  label: 'crm.close.date'.tr,
                  isReadOnly: true,
                  onTap: () {
                    controller.selectDate(
                      'closeDate',
                      false,
                    );
                  },
                  validator: [(val) => controller.validateCloseDate(val ?? '')],
                  initialValue:
                      controller.opportunityInfo.value?.closeDate != null
                          ? DateUtil.formatDatetimeToString(
                              controller.opportunityInfo.value!.closeDate!)
                          : ''),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: WidgetInputLabel(
                            label: 'crm.opportunity.reason'.tr,
                          )),
                      _buildDropdown(
                          name: 'stageReasonId',
                          isRequired: false,
                          initialValue: controller
                              .opportunityInfo.value!.opportunityStageReasonId,
                          enabled: controller.stageReasons.isNotEmpty,
                          items: controller.stageReasons.isNotEmpty
                              ? controller.stageReasons
                                  .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child:
                                          Text(e.opportunityStageReasonName!)))
                                  .toList()
                              : []),
                    ],
                  )),
            ],
          )),
    );
  }

  Column _buildEmployee() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.account.personal.in.charge'.tr,
              isRequired: true,
            )),
        FormBuilderTextField(
          name: 'employeeId',
          readOnly: true,
          initialValue: controller.opportunityInfo.value?.getEmployeeFullName(),
          enabled: false,
          style: AppTextStyle.regular(color: const Color(0xFF9098A1)),
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'crm.validation.required'.tr),
          ]),
        ),
      ],
    );
  }

  Column _buildSelectDate({
    required String name,
    required String label,
    bool isRequired = false,
    bool isReadOnly = false,
    String initialValue = '',
    required Function onTap,
    dynamic? validator,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WidgetInputLabel(
              label: label,
              isRequired: isRequired,
            )),
        FormBuilderTextField(
          name: name,
          readOnly: isReadOnly,
          initialValue: initialValue,
          onTap: () => onTap(),
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.calendar_month_outlined),
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: FormBuilderValidators.compose([
            if (isRequired)
              FormBuilderValidators.required(
                  errorText: 'crm.validation.required'.tr),
            ...?validator
          ]),
        ),
      ],
    );
  }

  FormBuilderDropdown<int> _buildDropdown({
    required String name,
    required List<DropdownMenuItem<int>> items,
    Function(int id)? onChanged,
    bool enabled = true,
    bool isRequired = false,
    int? initialValue,
  }) {
    return FormBuilderDropdown(
      name: name,
      enabled: enabled,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged(value as int);
        }
      },
      initialValue: initialValue,
      items: items,
      decoration: const InputDecoration(
        errorStyle: TextStyle(height: 0),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
      validator: FormBuilderValidators.compose([
        if (isRequired)
          FormBuilderValidators.required(
              errorText: 'crm.validation.required'.tr),
      ]),
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
                backgroundColor: Colors.white,
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
                backgroundColor: AppColor.primaryColor,
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
