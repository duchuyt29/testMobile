import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../controllers/crm_filter_contact_controller.dart';

class CrmFilterContactPage extends GetView<CrmFilterContactController> {
  const CrmFilterContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.contact.filter'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CrmWidgetBuildCombobox(
                    title: 'crm.contact.gender'.tr,
                    name: 'customertype',
                    initialValue: controller.indexGender,
                    isRequired: false,
                    items: controller.crmMasterData?.listGender
                            ?.map((e) => e.genderName ?? '')
                            .toList() ??
                        [],
                    onChanged: (index) {
                      controller.selectGender(index);
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
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.city'.tr,
                      text: controller.filter.value.provinceName ?? '',
                      onPress: controller.loadProvince,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.district'.tr,
                      text: controller.filter.value.districtName ?? '',
                      onPress: controller.loadDistrict,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.ward'.tr,
                      text: controller.filter.value.wardName ?? '',
                      onPress: controller.loadWard,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
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
              onPressed: controller.onClear,
              child: Text(
                'Xoá bộ lọc',
                style: AppTextStyle.regular(
                    fontSize: 18, color: AppColor.primaryColor),
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
                'crm.contact.apply'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
