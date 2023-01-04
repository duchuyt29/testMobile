import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controllers/account_address_form_controllers.dart';

class AccountAddressFormPage extends GetView<AccountAddressFormController> {
  AccountAddressFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.addressId == null
              ? 'crm.account.address.add_new'.tr
              : 'crm.account.address.edit'.tr,
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
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  _buildFormContent(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                controller.onSubmitAddress();
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  CrmWidgetBuildCombobox(
                    title: 'crm.account.address.type'.tr,
                    name: 'addressType',
                    isRequired: true,
                    initialValue: controller.indexAddressType,
                    items: controller.crmMasterData?.listAccountAddressType
                            ?.map((e) => e.accountAddressTypeName ?? '')
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.selectType(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildCombobox(
                    title: 'crm.account.country'.tr,
                    name: 'country',
                    initialValue: controller.indexCountry,
                    items: controller.crmMasterData?.listCountry
                            ?.map((e) => e.countryName ?? '')
                            .toList() ??
                        [],
                    onChanged: (value) {
                      controller.selectCountry(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetFormLabelBox(
                    label: 'crm.account.city'.tr,
                    text: controller
                            .accountAddress.value?.accountAddressProvinceName ??
                        '',
                    onPress: controller.loadProvince,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetFormLabelBox(
                    label: 'crm.account.district'.tr,
                    text: controller
                            .accountAddress.value?.accountAddressDistrictName ??
                        '',
                    onPress: controller.loadDistrict,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetFormLabelBox(
                    label: 'crm.account.ward'.tr,
                    text: controller
                            .accountAddress.value?.accountAddressWardName ??
                        '',
                    onPress: controller.loadWard,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.ZIP.code'.tr,
                    name: 'zipCode',
                    textInputType: TextInputType.name,
                    controller: controller.zipCode,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.address'.tr,
                    name: 'address',
                    textInputType: TextInputType.name,
                    controller: controller.address,
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }
}
