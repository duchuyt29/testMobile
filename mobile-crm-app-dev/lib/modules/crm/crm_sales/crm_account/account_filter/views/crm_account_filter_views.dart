import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../controllers/crm_account_filter_controllers.dart';

class CrmAccountFilterPage extends StatelessWidget {
  CrmAccountFilterPage({Key? key}) : super(key: key);

  final CrmAccountFilterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.filter'.tr,
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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.account.personal.in.charge'.tr,
                        text: controller.responsiableText.value,
                        onPress: controller.loadEmployee,
                      )),
                  const SizedBox(height: 24),
                  CrmWidgetBuildCombobox(
                    title: 'crm.account.customertype'.tr,
                    name: 'personalRole',
                    initialValue: controller.indexAccountType,
                    items: controller.crmMasterData?.listAccountType
                            ?.map((e) => e.accountTypeName ?? '')
                            .toList() ??
                        [],
                    onChanged: controller.selectAccountType,
                  ),
                  const SizedBox(height: 24),
                  CrmWidgetBuildCombobox(
                    title: 'crm.account.bussinessfiled'.tr,
                    name: 'bussinessfiled',
                    initialValue: controller.indexIndustry,
                    items: controller.crmMasterData?.listIndustry
                            ?.map((e) => e.industryName ?? '')
                            .toList() ??
                        [],
                    onChanged: controller.selectIndustry,
                  ),
                  const SizedBox(height: 24),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.contact'.tr,
                        text: controller.filter.value.contactNameToString(),
                        onPress: controller.loadContact,
                      )),
                  const SizedBox(height: 24),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.account.related.customer'.tr,
                        text: controller
                                .filter.value.relativeAccount?.accountName ??
                            '',
                        onPress: controller.loadCustomer,
                      )),
                  const SizedBox(height: 24),
                  CrmWidgetBuildCombobox(
                    title: 'crm.contact.gender'.tr,
                    name: 'customertype',
                    initialValue: controller.indexGender,
                    items: controller.crmMasterData?.listGender
                            ?.map((e) => e.genderName ?? '')
                            .toList() ??
                        [],
                    onChanged: controller.selectGender,
                  ),
                  const SizedBox(height: 24),
                  CrmWidgetBuildCombobox(
                    title: 'crm.account.country'.tr,
                    name: 'country',
                    initialValue: controller.indexCountry,
                    items: controller.crmMasterData?.listCountry
                            ?.map((e) => e.countryName ?? '')
                            .toList() ??
                        [],
                    onChanged: controller.selectCountry,
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.city'.tr,
                      text: controller.filter.value.accountBillingProvince
                              ?.provinceName ??
                          '',
                      onPress: controller.loadProvince,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CrmWidgetFormLabelBox(
                      label: 'crm.account.district'.tr,
                      text: controller.filter.value.accountBillingDistrict
                              ?.districtName ??
                          '',
                      onPress: controller.loadDistrict,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.account.ward'.tr,
                        text: controller
                                .filter.value.accountBillingWard?.wardName ??
                            '',
                        onPress: controller.loadWard,
                      )),
                ],
              ),
            ),
          ],
        ),
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
