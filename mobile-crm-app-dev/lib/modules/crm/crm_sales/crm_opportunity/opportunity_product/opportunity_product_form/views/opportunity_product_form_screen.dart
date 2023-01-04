import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/opportunity_product_form_controller.dart';

class OpportunityProductFormScreen
    extends GetView<OpportunityProductFormController> {
  const OpportunityProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'crm.product.title'.tr,
            style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
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
      children: [
        Expanded(child: _buildFormContent()),
        _buildButtonSave(),
      ],
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
                  name: 'priceId',
                  label: 'crm.product.pricelist'.tr,
                  isReadOnly: true,
                  isDisabled: true,
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  initialValue:
                      controller.opportunityPrice.value?.priceName ?? '',
                  isRequired: true),
              _buildTextField(
                  name: 'productId',
                  onTap: controller.onViewProductPrice,
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  label: 'crm.opportunity.price.product'.tr,
                  initialValue: controller.productInfo.value.productName ?? '',
                  isReadOnly: true,
                  isRequired: true),
              _buildTextField(
                  name: 'currencyId',
                  label: 'crm.price.currency'.tr,
                  isDisabled: true,
                  isReadOnly: true,
                  initialValue:
                      controller.opportunityInfo.value.getCurrencyName(),
                  isRequired: true),
              _buildTextField(
                  name: 'quantity',
                  keyboardType: TextInputType.number,
                  controller: controller.quantityTextController,
                  label: 'crm.opportunity.product.quantity'.tr,
                  onChanged: (String value) {
                    if (value.isNotEmpty) {
                      controller.onCalculateTotalAmount();
                    }
                  },
                  validator: [
                    FormBuilderValidators.numeric(
                        errorText: 'crm.error.number'.tr),
                    FormBuilderValidators.min(1, errorText: 'crm.error.min'.tr),
                    FormBuilderValidators.integer(
                        errorText: 'crm.error.integer'.tr)
                  ],
                  isRequired: true),
              _buildTextField(
                  name: 'amount',
                  keyboardType: TextInputType.number,
                  controller: controller.amountTextController,
                  onChanged: (String value) {
                    if (value.isNotEmpty) {
                      controller.onCalculateTotalAmount();
                    }
                  },
                  label: 'crm.opportunity.product.price'.tr,
                  // initialValue: controller.opportunityInfo.value?.opportunityName,
                  validator: [
                    FormBuilderValidators.numeric(
                        errorText: 'crm.error.number'.tr),
                    FormBuilderValidators.min(1, errorText: 'crm.error.min'.tr),
                    FormBuilderValidators.integer(
                        errorText: 'crm.error.integer'.tr)
                  ],
                  isRequired: true),
              _buildTextField(
                name: 'listPrice',
                isReadOnly: true,
                isDisabled: true,
                label: 'crm.opportunity.product.default.price'.tr,
              ),
              _buildTextField(
                name: 'totalAmount',
                isReadOnly: true,
                isDisabled: true,
                label: 'crm.opportunity.amount'.tr,
                initialValue: '0',
              ),
            ],
          )),
    );
  }

  Widget _buildTextField({
    Function? onTap,
    Function? onChanged,
    required String name,
    required String label,
    bool isRequired = false,
    TextEditingController? controller,
    bool isReadOnly = false,
    bool isDisabled = false,
    dynamic? initialValue,
    dynamic keyboardType = TextInputType.text,
    Widget suffixIcon = const SizedBox.shrink(),
    dynamic validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 8),
              child: WidgetInputLabel(
                label: label,
                isRequired: isRequired,
              )),
          FormBuilderTextField(
            controller: controller,
            onTap: onTap as void Function()?,
            name: name,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged(value);
              }
            },
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              onPressed: controller.onSubmitted,
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
