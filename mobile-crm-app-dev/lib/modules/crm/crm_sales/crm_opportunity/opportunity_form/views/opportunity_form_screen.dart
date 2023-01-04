import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/opportunity_form_controller.dart';

class OpportunityFormScreen extends GetView<OpportunityFormController> {
  const OpportunityFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crm.opportunity.new'.tr,
            style: AppTextStyle.heavy(color: Colors.white)),
      ),
      body: SafeArea(top: false, child: Obx(_buildBodyContent)),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
            child: SingleChildScrollView(
          child: _buildFormContent(),
        ))
      ],
    );
  }

  Widget _buildFormContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          FormBuilder(
              key: controller.fbKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.opportunity.status.info'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(children: [
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
                                isRequired: true,
                                onChanged: controller.onChangeStage,
                                items: controller
                                    .crmMasterData!.listOpportunityStage!
                                    .map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.opportunityStageName!)))
                                    .toList()),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildSelectDate(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildSelectCloseDate(),
                        Column(
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
                                enabled: controller.stageReasons.isNotEmpty,
                                items: controller.stageReasons.isNotEmpty
                                    ? controller.stageReasons
                                        .map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(
                                                e.opportunityStageReasonName!)))
                                        .toList()
                                    : []),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.opportunity.info'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          _buildTextField(
                              name: 'opportunityName',
                              label: 'crm.opportunity.name'.tr,
                              isRequired: true),
                          _buildTextField(
                              name: 'accountId',
                              label: 'crm.customer'.tr,
                              suffixIcon: const Icon(Icons.arrow_drop_down),
                              onTap: controller.onAccount,
                              isReadOnly: true,
                              isRequired: true),
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
                                    label: 'crm.opportunity.type'.tr.tr,
                                  )),
                              FormBuilderDropdown(
                                name: 'typeId',
                                items: controller
                                    .crmMasterData!.opportunityType!
                                    .map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.opportunityTypeName!)))
                                    .toList(),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(height: 0),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                  child: WidgetInputLabel(
                                    label: 'crm.opportunity.lead.source'.tr.tr,
                                  )),
                              FormBuilderDropdown(
                                name: 'leadSourceId',
                                items: (controller.crmMasterData?.leadSources ??
                                        [])
                                    .map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.leadSourceName ?? '')))
                                    .toList(),
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(height: 0),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ],
                          ),
                          _buildTextField(
                            name: 'probability',
                            label: 'crm.opportunity.probability'.tr,
                            keyboardType: TextInputType.number,
                            suffixIcon: const Icon(
                              Icons.percent_outlined,
                              size: 16,
                            ),
                            validator: [
                              FormBuilderValidators.numeric(
                                  errorText: 'crm.error.number'.tr),
                              FormBuilderValidators.min(0,
                                  errorText: 'crm.error.min'.tr),
                              FormBuilderValidators.integer(
                                  errorText: 'crm.error.integer'.tr),
                              FormBuilderValidators.max(100,
                                  errorText: 'crm.error.max'.tr),
                            ],
                          ),
                          _buildTextField(
                              name: 'currencyExchangeRateId',
                              label: 'crm.opportunity.currency'.tr,
                              suffixIcon: const Icon(Icons.arrow_drop_down),
                              onTap: controller.onCurrency,
                              isReadOnly: true,
                              isRequired: true),
                          _buildTextField(
                            name: 'amount',
                            label: 'crm.opportunity.amount'.tr,
                            isReadOnly: true,
                            isDisabled: true,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.lead.additional'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          _buildTextField(
                            name: 'description',
                            label: 'crm.exchange.desc'.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
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
          enabled: false,
          initialValue: controller.employInfo.value.getFullName(),
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

  Column _buildSelectCloseDate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.close.date'.tr,
            )),
        FormBuilderTextField(
          name: 'closeDate',
          readOnly: true,
          onTap: () {
            controller.selectDate('closeDate', false);
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.calendar_month_outlined),
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: FormBuilderValidators.compose([
            // validate close date > start date (if start date is not null) and close date > today date
            (val) => controller.validateCloseDate(val ?? '')
          ]),
        ),
      ],
    );
  }

  Column _buildSelectDate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.activity.begin.day'.tr,
              isRequired: true,
            )),
        FormBuilderTextField(
          name: 'startDate',
          readOnly: true,
          initialValue:
              DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
          onTap: () {
            controller.selectDate('startDate', true);
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.calendar_month_outlined),
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

  FormBuilderDropdown<int> _buildDropdown({
    required String name,
    required List<DropdownMenuItem<int>> items,
    Function(int id)? onChanged,
    bool enabled = true,
    bool isRequired = false,
  }) {
    return FormBuilderDropdown(
      name: name,
      enabled: enabled,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged(value as int);
        }
      },
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

  Widget _buildTextField({
    required String name,
    required String label,
    bool isRequired = false,
    String? initialValue,
    dynamic keyboardType = TextInputType.text,
    bool isDisabled = false,
    bool isReadOnly = false,
    Widget suffixIcon = const SizedBox.shrink(),
    dynamic validator,
    Function(String?)? onChanged,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
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
            onTap: onTap,
            name: name,
            readOnly: isReadOnly,
            onChanged: onChanged,
            initialValue: initialValue,
            keyboardType: keyboardType,
            style: isDisabled
                ? AppTextStyle.regular(color: const Color(0xFF9098A1))
                : AppTextStyle.regular(),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorStyle: const TextStyle(height: 0),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
      ),
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
