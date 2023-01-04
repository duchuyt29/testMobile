import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_create_product_in_price_controller.dart';

class CrmCreateProductsInPricePage
    extends GetView<CrmCreateProductsInPriceController> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildHeaderContent(),
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 1,
          color: const Color.fromARGB(255, 227, 227, 227),
        ),
        const SizedBox(height: 15),
        _buildFormContent()
      ],
    );
  }

  Row _buildHeaderContent() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextButton(
        onPressed: Get.back,
        child: Text(
          'Hủy',
          style: AppTextStyle.regular(fontSize: 18, color: Colors.blue),
        ),
      ),
      Text(
        'crm.product.new'.tr,
        style: AppTextStyle.regular(fontSize: 20),
      ),
      TextButton(
        onPressed: () {
          controller.onSubmitted();
        },
        child: Text(
          'Lưu',
          style: AppTextStyle.regular(fontSize: 18, color: Colors.blue),
        ),
      ),
    ]);
  }

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          FormBuilder(
              key: controller.fbKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildProduct(),
                  const SizedBox(height: 10),
                  _buildPrice(),
                  const SizedBox(height: 10),
                  _buildCurrency(),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('crm.price.standard'.tr),
                              const SizedBox(width: 20),
                              Checkbox(
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  checkColor: Colors.blue,
                                  value: isChecked == true,
                                  onChanged: null),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildGia(),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildProduct() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.product.title'.tr,
              isRequired: true,
            )),
        FormBuilderDropdown(
          name: 'productCode',
          items: const [
            DropdownMenuItem(
              value: '1',
              child: Text('1'),
            ),
            DropdownMenuItem(
              value: '2',
              child: Text('2'),
            ),
          ],
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'crm.validation.required'.tr),
          ]),
        )
      ],
    );
  }

  Widget _buildCurrency() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.price.currency'.tr,
              isRequired: true,
            )),
        FormBuilderDropdown(
          name: 'currencyCode',
          items: const [
            DropdownMenuItem(
              value: '1',
              child: Text('1'),
            ),
            DropdownMenuItem(
              value: '2',
              child: Text('2'),
            ),
          ],
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'crm.validation.required'.tr),
          ]),
        )
      ],
    );
  }

  Widget _buildPrice() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: 'crm.product.pricelist'.tr,
              // isRequired: true,
            )),
        FormBuilderTextField(
          name: 'priceCode',
          keyboardType: TextInputType.name,
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

  Widget _buildGia() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 10, right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: 'Giá',
              isRequired: true,
            )),
        FormBuilderTextField(
          name: 'giaCode',
          keyboardType: TextInputType.name,
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
}
