import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/opportunity_info_form_controller.dart';

class OpportunityInfoFormScreen extends GetView<OpportunityInfoFormController> {
  const OpportunityInfoFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'crm.opportunity.info.edit'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Obx(
          () => SafeArea(
              top: false,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false, child: _buildBodyContent()),
                ],
              )),
        ));
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
              _buildTextField(
                  name: 'opportunityName',
                  label: 'crm.opportunity.name'.tr,
                  initialValue:
                      controller.opportunityInfo.value?.opportunityName,
                  isRequired: true),
              _buildTextField(
                  name: 'accountId',
                  label: 'crm.customer'.tr,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  initialValue: controller.opportunityInfo.value?.accountName,
                  onTap: controller.onAccount,
                  isReadOnly: true,
                  isRequired: true),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: WidgetInputLabel(
                        label: 'crm.opportunity.type'.tr.tr,
                      )),
                  _buildDropdown(
                      name: 'typeId',
                      initialValue:
                          controller.opportunityInfo.value?.opportunityTypeId,
                      items: controller.crmMasterData!.opportunityType!
                          .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.opportunityTypeName ?? '')))
                          .toList()),
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
                    initialValue:
                        controller.opportunityInfo.value?.leadSourceId,
                    items: (controller.crmMasterData?.leadSources ?? [])
                        .map((e) => DropdownMenuItem(
                            value: e.id, child: Text(e.leadSourceName ?? '')))
                        .toList(),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTextField(
                name: 'probability',
                label: 'crm.opportunity.probability'.tr,
                keyboardType: TextInputType.number,
                initialValue:
                    controller.opportunityInfo.value?.probability == null
                        ? '0'
                        : (controller.opportunityInfo.value!.probability! * 100)
                            .toStringAsFixed(0),
                suffixIcon: const Icon(
                  Icons.percent,
                  size: 16,
                ),
                validator: [
                  FormBuilderValidators.numeric(
                      errorText: 'crm.error.number'.tr),
                  FormBuilderValidators.min(0, errorText: 'crm.error.min'.tr),
                  FormBuilderValidators.integer(
                      errorText: 'crm.error.integer'.tr),
                  FormBuilderValidators.max(100, errorText: 'crm.error.max'.tr),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTextField(
                  name: 'currencyExchangeRateId',
                  label: 'crm.opportunity.currency'.tr,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  onTap: controller.onCurrency,
                  initialValue:
                      controller.opportunityInfo.value?.getCurrencyName(),
                  isReadOnly: true,
                  isRequired: true),
              const SizedBox(
                height: 10,
              ),
              _buildTextField(
                name: 'amount',
                label: 'crm.opportunity.amount'.tr,
                isReadOnly: true,
                isDisabled: true,
                initialValue: controller.opportunityInfo.value?.getAmount(),
              )
            ],
          )),
    );
  }

  FormBuilderDropdown<int> _buildDropdown({
    required String name,
    required List<DropdownMenuItem<int>> items,
    bool isRequired = false,
    int? initialValue,
  }) {
    return FormBuilderDropdown(
      name: name,
      items: items,
      initialValue: initialValue,
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
    bool isReadOnly = false,
    dynamic? initialValue,
    dynamic keyboardType = TextInputType.text,
    bool isDisabled = false,
    Widget suffixIcon = const SizedBox.shrink(),
    dynamic validator,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
            initialValue: initialValue,
            keyboardType: keyboardType,
            style: AppTextStyle.regular(
                color: isDisabled
                    ? const Color(0xFF9098A1)
                    : const Color(0xFF000000)),
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
              ...?validator,
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
