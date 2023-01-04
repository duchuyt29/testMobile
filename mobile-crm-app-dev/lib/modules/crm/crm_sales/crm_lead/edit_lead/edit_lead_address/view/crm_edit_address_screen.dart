import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controller/crm_detail_lead_address_edit_controller.dart';

class CrmEditLeadAddressScreen extends GetView<CrmEditLeadAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.address.title'.tr,
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
      child: Column(
        children: [
          CrmWidgetBuildCombobox(
            title: 'crm.account.address.type'.tr,
            name: 'addressType',
            items: controller.crmMasterData?.listAccountAddressType
                    ?.map((e) => e.accountAddressTypeName ?? '')
                    .toList() ??
                [],
            onChanged: controller.onSelectedAddressType,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildCombobox(
            title: 'crm.account.country'.tr,
            name: 'country',
            items: controller.crmMasterData?.listCountry
                    ?.map((e) => e.countryName ?? '')
                    .toList() ??
                [],
            onChanged: controller.onSelectedCountry,
          ),
          const SizedBox(height: 10),
          Obx(
            () => CrmWidgetFormLabelBox(
              label: 'crm.account.city'.tr,
              text: controller.currentProvince.value?.provinceName ?? '',
              onPress: controller.onSelectionProvince,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => CrmWidgetFormLabelBox(
              label: 'crm.account.district'.tr,
              text: controller.currentDistrict.value?.districtName ?? '',
              onPress: controller.onSelectionDistrict,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => CrmWidgetFormLabelBox(
              label: 'crm.account.ward'.tr,
              text: controller.currentWard.value?.wardName ?? '',
              onPress: controller.onSelectionWard,
            ),
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
              title: 'crm.account.ZIP.code'.tr,
              name: 'zipCode',
              controller: controller.postalCodeController,
              textInputType: TextInputType.name),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
              title: 'crm.account.address'.tr,
              name: 'address',
              controller: controller.addressController,
              textInputType: TextInputType.name),
        ],
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
