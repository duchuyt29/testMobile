import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_form_information_contact_controllers.dart';

class CrmFromInformationContactPage
    extends GetView<CrmFromInformationContactController> {
  const CrmFromInformationContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.contact.create.new'.tr,
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
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            _buildFormContent(),
          ],
        ),
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

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(
        bottom: Get.context!.mediaQueryViewInsets.bottom + 60,
      ),
      child: Column(
        children: [
          FormBuilder(
              key: controller.fbKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Container(
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.contact.infor'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      controller: ExpandableController()..expanded = true,
                      collapsed: const SizedBox.shrink(),
                      expanded: _buildInfoContent(),
                    ),
                  ),
                  // build single choice dialog
                  const SizedBox(height: 5),
                  Container(
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.contact.relationship'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildContactRelationShip(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.contact.permanent.address'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildContactAddress(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          'crm.contact.permanent.contact'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildPermanentAddress(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildInfoContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrmWidgetBuildFormTextField(
            title: 'crm.account.fullname'.tr,
            name: 'fullName',
            controller: controller.nameController,
            textInputType: TextInputType.name,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildCombobox(
            title: 'crm.contact.title_name'.tr,
            name: 'customertype',
            initialValue: controller.indexSalutation,
            isRequired: true,
            items: controller.crmMasterData?.listSalutation
                    ?.map((e) => e.salutationName ?? '')
                    .toList() ??
                [],
            onChanged: (index) {
              controller.selectSalutation(index);
            },
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.contact.phone.number'.tr,
            name: 'phoneNumber',
            controller: controller.phoneController,
            textInputType: TextInputType.phone,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
              title: 'Email',
              name: 'email',
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress),
          const SizedBox(height: 10),
          CrmWidgetBuildCombobox(
            title: 'crm.contact.gender'.tr,
            name: 'customertype',
            initialValue: controller.indexGender,
            isRequired: true,
            items: controller.crmMasterData?.listGender
                    ?.map((e) => e.genderName ?? '')
                    .toList() ??
                [],
            onChanged: (index) {
              controller.selectGender(index);
            },
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
              title: 'crm.contact.position'.tr,
              name: 'chuvu',
              controller: controller.titleController,
              textInputType: TextInputType.name),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.contact.owner_employee'.tr,
            name: 'nhansu',
            controller: controller.employeeController,
            textInputType: TextInputType.name,
            disable: true,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 8),
              child: WidgetInputLabel(
                label: 'crm.account.des'.tr,
              )),
          FormBuilderTextField(
            name: 'accountDes',
            controller: controller.noteController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.all(10),
            ),
            maxLines: 3,
            inputFormatters: [
              LengthLimitingTextInputFormatter(255),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container _buildContactRelationShip() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CrmWidgetFormLabelBox(
                label: 'crm.customer'.tr,
                text: controller.name.value,
                onPress: controller.selectCustomer,
                isRequired: controller.accountRequired.value,
              ),
              Positioned(
                right: 35,
                top: 48,
                child: Visibility(
                  visible: controller.contact.value.accountId != null,
                  child: InkWell(
                    onTap: controller.clearCustomer,
                    child: Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: controller.accountRequired.value,
            child: Stack(
              children: [
                CrmWidgetBuildCombobox(
                  title: 'crm.contact.relationship_type'.tr,
                  name: 'relationship_type',
                  initialValue: controller.indexRelationType,
                  isRequired: true,
                  items: controller.crmMasterData?.listAccountRelationType
                          ?.map((e) => e.accountRelationTypeName ?? '')
                          .toList() ??
                      [],
                  onChanged: (index) {
                    controller.selectRelationType(index);
                  },
                ),
                Positioned(
                  right: 35,
                  top: 48,
                  child: Visibility(
                    visible:
                        controller.contact.value.accountRelationTypeId != null,
                    child: InkWell(
                      onTap: controller.clearRelationType,
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !controller.accountRequired.value,
            child: Stack(
              children: [
                CrmWidgetBuildCombobox(
                  title: 'crm.contact.relationship_type'.tr,
                  name: 'relationship_type',
                  initialValue: controller.indexRelationType,
                  isRequired: false,
                  items: controller.crmMasterData?.listAccountRelationType
                          ?.map((e) => e.accountRelationTypeName ?? '')
                          .toList() ??
                      [],
                  onChanged: (index) {
                    controller.selectRelationType(index);
                  },
                ),
                Positioned(
                  right: 35,
                  top: 48,
                  child: Visibility(
                    visible:
                        controller.contact.value.accountRelationTypeId != null,
                    child: InkWell(
                      onTap: controller.clearRelationType,
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildContactAddress() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrmWidgetBuildCombobox(
            title: 'crm.account.country'.tr,
            name: 'country',
            initialValue: controller.indexCountryContact,
            items: controller.crmMasterData?.listCountry
                    ?.map((e) => e.countryName ?? '')
                    .toList() ??
                [],
            onChanged: (value) {
              controller.selectCountry(value, CommonConstants.contactBilling);
            },
          ),
          const SizedBox(height: 10),
          Obx(() => CrmWidgetFormLabelBox(
                label: 'crm.account.city'.tr,
                text: controller.contact.value.contactBillingProvinceName ?? '',
                onPress: () {
                  controller.loadProvince(CommonConstants.contactBilling);
                },
              )),
          const SizedBox(height: 10),
          Obx(() => CrmWidgetFormLabelBox(
                label: 'crm.account.district'.tr,
                text: controller.contact.value.contactBillingDistrictName ?? '',
                onPress: () {
                  controller.loadDistrict(CommonConstants.contactBilling);
                },
              )),
          const SizedBox(height: 10),
          Obx(() => CrmWidgetFormLabelBox(
                label: 'crm.account.ward'.tr,
                text: controller.contact.value.contactBillingWardName ?? '',
                onPress: () {
                  controller.loadWard(CommonConstants.contactBilling);
                },
              )),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.account.ZIP.code'.tr,
            name: 'zipCode',
            textInputType: TextInputType.name,
            controller: controller.zipCodeContactController,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.account.address'.tr,
            name: 'address',
            textInputType: TextInputType.name,
            controller: controller.addressContactController,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildPermanentAddress() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrmWidgetBuildCombobox(
            title: 'crm.account.country'.tr,
            name: 'country',
            initialValue: controller.indexCountryPermanent,
            items: controller.crmMasterData?.listCountry
                    ?.map((e) => e.countryName ?? '')
                    .toList() ??
                [],
            onChanged: (value) {
              controller.selectCountry(value, CommonConstants.contactShipping);
            },
          ),
          const SizedBox(height: 10),
          CrmWidgetFormLabelBox(
            label: 'crm.account.city'.tr,
            text: controller.contact.value.contactShippingProvinceName ?? '',
            onPress: () {
              controller.loadProvince(CommonConstants.contactShipping);
            },
          ),
          const SizedBox(height: 10),
          CrmWidgetFormLabelBox(
            label: 'crm.account.district'.tr,
            text: controller.contact.value.contactShippingDistrictName ?? '',
            onPress: () {
              controller.loadDistrict(CommonConstants.contactShipping);
            },
          ),
          const SizedBox(height: 10),
          CrmWidgetFormLabelBox(
            label: 'crm.account.ward'.tr,
            text: controller.contact.value.contactShippingWardName ?? '',
            onPress: () {
              controller.loadWard(CommonConstants.contactShipping);
            },
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.account.ZIP.code'.tr,
            name: 'zipCode',
            textInputType: TextInputType.name,
            controller: controller.zipCodePermanentController,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.account.address'.tr,
            name: 'address',
            textInputType: TextInputType.name,
            controller: controller.addressPermanentController,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
