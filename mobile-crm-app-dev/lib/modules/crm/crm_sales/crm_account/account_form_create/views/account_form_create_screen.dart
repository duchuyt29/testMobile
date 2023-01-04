import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/account_form_create_controller.dart';

class AccountFormCreatePage extends GetView<AccountFormCreateController> {
  const AccountFormCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.create.new'.tr,
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
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFormContent(),
            ],
          ),
        ))
      ],
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

  Widget _buildFormContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
                          'crm.account.information'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      controller: ExpandableController()..expanded = true,
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCustomerInfo(),
                            ],
                          ),
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
                          'crm.account.address.default'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: _buildAddress(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ExpandablePanel(
                      header: Container(
                        child: Text(
                          controller.accountInfo.value.accountTypeId == 1
                              ? 'crm.account.identification'.tr
                              : 'crm.account.info_company'.tr,
                          style: AppTextStyle.heavy(fontSize: 20),
                        ),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [_buildIdentification()],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Container(
      child: Column(
        children: [
          CrmWidgetBuildFormTextField(
            title: 'crm.account.fullname'.tr,
            name: 'fullName',
            controller: controller.name,
            textInputType: TextInputType.name,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetFormLabelBox(
            label: 'crm.account.customertype'.tr,
            text: controller.accountInfo.value.accountTypeName ?? '',
            disable: true,
            onPress: () {},
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
            title: 'crm.account.phone.number'.tr,
            name: 'phoneNumber',
            controller: controller.phone,
            textInputType: TextInputType.number,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormTextField(
              title: 'crm.account.email'.tr,
              name: 'email',
              controller: controller.email,
              textInputType: TextInputType.emailAddress),
          Visibility(
            visible: controller.accountInfo.value.accountTypeId != 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CrmWidgetBuildFormTextField(
                title: '${'crm.account.phone.number'.tr} 1',
                name: 'phoneNumber',
                controller: controller.phone1,
                textInputType: TextInputType.number,
                isRequired: false,
              ),
            ),
          ),
          Visibility(
            visible: controller.accountInfo.value.accountTypeId == 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CrmWidgetBuildCombobox(
                title: 'crm.account.gender'.tr,
                name: 'gender',
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
            ),
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildCombobox(
            title: 'crm.account.bussinessfiled'.tr,
            name: 'bussinessfiled',
            isRequired: true,
            initialValue: controller.indexIndustry,
            items: controller.crmMasterData?.listIndustry
                    ?.map((e) => e.industryName ?? '')
                    .toList() ??
                [],
            onChanged: (index) {
              controller.selectIndustry(index);
            },
          ),
          Visibility(
            visible: controller.accountInfo.value.accountTypeId != 1,
            child: Obx(() => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CrmWidgetFormLabelBox(
                    label: 'crm.account.parent.level'.tr,
                    text: controller.parentName.value,
                    onPress: controller.loadParentAccount,
                    isRequired: false,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CrmWidgetFormLabelBox(
              label: 'crm.account.personal.in.charge'.tr,
              text: controller.userInfo?.getName() ?? '',
              disable: true,
              onPress: () {},
              isRequired: true,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24, bottom: 8),
                child: WidgetInputLabel(
                  label: 'crm.account.des'.tr,
                  isRequired: false,
                ),
              ),
              FormBuilderTextField(
                name: 'description',
                controller: controller.note,
                keyboardType: TextInputType.name,
                readOnly: false,
                maxLines: 3,
                style: AppTextStyle.regular(color: const Color(0xFF000000)),
                decoration: const InputDecoration(
                  errorStyle: TextStyle(height: 0),
                  contentPadding: EdgeInsets.all(10),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(255),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      child: Column(children: [
        CrmWidgetBuildCombobox(
          title: 'crm.account.address.type'.tr,
          name: 'addressType',
          initialValue: controller.indexAddressType,
          items: controller.crmMasterData?.listAccountAddressType
                  ?.map((e) => e.accountAddressTypeName ?? '')
                  .toList() ??
              [],
          isRequired: false,
          onChanged: (value) {
            controller.selectAddressType(value);
          },
        ),
        const SizedBox(height: 10),
        CrmWidgetBuildCombobox(
          title: 'crm.account.country'.tr,
          name: 'country',
          isRequired: false,
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
        Obx(() => CrmWidgetFormLabelBox(
              label: 'crm.account.city'.tr,
              isRequired: false,
              text:
                  controller.accountAddress.value?.accountAddressProvinceName ??
                      '',
              onPress: controller.loadProvince,
            )),
        const SizedBox(height: 10),
        Obx(() => CrmWidgetFormLabelBox(
              label: 'crm.account.district'.tr,
              isRequired: false,
              text:
                  controller.accountAddress.value?.accountAddressDistrictName ??
                      '',
              onPress: controller.loadDistrict,
            )),
        const SizedBox(height: 10),
        Obx(() => CrmWidgetFormLabelBox(
              label: 'crm.account.ward'.tr,
              isRequired: false,
              text:
                  controller.accountAddress.value?.accountAddressWardName ?? '',
              onPress: controller.loadWard,
            )),
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
        // CheckboxListTile(
        //   title: const Text('Địa chỉ mặc định'),
        //   value: controller.isMainAddress.value,
        //   onChanged: (newValue) {
        //     controller.selectMainAddress(newValue!);
        //   },
        //   controlAffinity:
        //       ListTileControlAffinity.leading, //  <-- leading Checkbox
        // ),
      ]),
    );
  }

  Widget _buildIdentification() {
    return Container(
      child: Column(children: [
        Obx(
          () => CrmWidgetBuildCombobox(
            title: 'crm.account.kind.of.papers'.tr,
            name: 'kindOfPaper',
            initialValue: null,
            isRequired: true,
            items: controller.listDocumentType
                .map((e) => e.documentTypeName ?? '')
                .toList(),
            onChanged: (index) {
              controller.selectDocumentType(index);
            },
          ),
        ),
        const SizedBox(height: 10),
        CrmWidgetBuildFormTextField(
          title: 'crm.account.number.of.papers'.tr,
          name: 'numberOfPaper',
          controller: controller.documentNumberController,
          textInputType: TextInputType.number,
          isRequired: true,
        ),
        const SizedBox(height: 10),
        CrmWidgetBuildFormDateField(
          title: 'crm.account.date.range'.tr,
          controller: controller.issueDateController,
          selectDate: () => controller.selectDate(
              controller.issueDateController, controller.issueDate),
          isRequired: false,
        ),
        const SizedBox(height: 10),
        CrmWidgetBuildFormTextField(
            title: 'crm.account.place'.tr,
            name: 'place',
            controller: controller.issuePlaceController,
            textInputType: TextInputType.name),
        const SizedBox(height: 10),
        CrmWidgetBuildFormTextField(
            title: 'crm.account.note'.tr,
            name: 'note',
            controller: controller.noteDocumentController,
            textInputType: TextInputType.name),
        const SizedBox(height: 10),
      ]),
    );
  }
}
