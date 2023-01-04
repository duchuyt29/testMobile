import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controllers/crm_form_address_contact_controllers.dart';

class CrmFromAddressContactPage
    extends GetView<CrmFromAddressContactController> {
  const CrmFromAddressContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.type.value == CommonConstants.contactBilling
              ? 'crm.account.address_billing.edit'.tr
              : 'crm.account.address_shipping.edit'.tr,
          style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SafeArea(
        top: false,
        child: _buildFormContent(),
      ),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          FormBuilder(
            key: controller.fbKey,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   child: Text(
                  //     controller.type.value == CommonConstants.contactBilling
                  //         ? 'crm.contact.permanent.address'.tr
                  //         : 'crm.contact.permanent.contact'.tr,
                  //     style: AppTextStyle.bold(fontSize: 20),
                  //   ),
                  // ),
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
                    text: controller.provinceName.value,
                    onPress: controller.loadProvince,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetFormLabelBox(
                    label: 'crm.account.district'.tr,
                    text: controller.districtName.value,
                    onPress: controller.loadDistrict,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetFormLabelBox(
                    label: 'crm.account.ward'.tr,
                    text: controller.wardName.value,
                    onPress: controller.loadWard,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.ZIP.code'.tr,
                    name: 'zipCode',
                    textInputType: TextInputType.name,
                    controller: controller.zipCodeController,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.address'.tr,
                    name: 'address',
                    textInputType: TextInputType.name,
                    controller: controller.addressController,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
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
}
