import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field_selection.dart';
import '../controllers/crm_create_lead_controllers.dart';

class CrmCreateLeadScreen extends GetView<CrmCreateLeadController> {
  const CrmCreateLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.create'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          WidgetIconButton(
            onPressed: controller.onScanQRCode,
            icon: Icons.qr_code,
            backgroundColor: AppColor.addIconButtonColor,
            size: 30,
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Widget _buildBodyContent() {
    return FormBuilder(
      key: controller.fbKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _buildLeadStatus(),
          _buildLeadInfo(),
          _buildLeadAddress(),
          _buildLeadAdditional(),
        ],
      ),
    );
  }

  Widget _buildLeadStatus() {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        iconPadding: EdgeInsets.all(20),
        expandIcon: Icons.expand_more,
        collapseIcon: Icons.expand_more,
      ),
      controller: ExpandableController()..expanded = true,
      header: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Text('crm.lead.status'.tr, style: AppTextStyle.heavy()),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        color: AppColor.primaryBackgroundColor,
        child: Column(
          children: [
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.personal.in.charge'.tr,
              name: 'employeeInCharge',
              controller: controller.employeeInChargeController,
              textInputType: TextInputType.text,
              isRequired: true,
              disable: true,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.lead.status'.tr,
              name: 'leadStage',
              initialValue: controller.indexLeadStage,
              isRequired: true,
              items: controller.crmMasterData?.listLeadStage
                      ?.map((e) => e.leadStageName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedLeadStatus,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.lead.potential.level'.tr,
              name: 'potenitalLevel',
              initialValue: controller.indexPotenitalLevel,
              items: controller.crmMasterData?.listLeadPotentialLevel
                      ?.map((e) => e.leadPotentialLevelName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedPotenitalLevel,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormDateField(
              title: 'crm.lead.startdate'.tr,
              controller: controller.startDateController,
              selectDate: () => controller.selectStartDate(),
            ),
            const SizedBox(height: 10),
            Obx(
              () => CrmWidgetBuildFormTextFieldSelection(
                title: 'crm.lead.refusal.reason'.tr,
                controller: controller.leadStageReasonController,
                isRequired: controller.isRequiredLeadStageReason.value,
                onPress: controller.onChangeLeadStageReason,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadInfo() {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        iconPadding: EdgeInsets.all(20),
        expandIcon: Icons.expand_more,
        collapseIcon: Icons.expand_more,
      ),
      header: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Text('crm.lead.infor'.tr, style: AppTextStyle.heavy()),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        color: AppColor.primaryBackgroundColor,
        child: Column(
          children: [
            CrmWidgetBuildFormTextField(
              title: 'crm.account.fullname'.tr,
              name: 'fullName',
              controller: controller.nameController,
              textInputType: TextInputType.name,
              isRequired: true,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.account.phone.number'.tr,
              name: 'phoneNumber',
              controller: controller.phoneController,
              textInputType: TextInputType.phone,
              isRequired: true,
            ),
            const SizedBox(height: 10),
            // CrmWidgetBuildCombobox(
            //   title: 'crm.account.gender'.tr,
            //   name: 'gender',
            //   initialValue: controller.indexGender,
            //   items: controller.crmMasterData?.listGender
            //           ?.map((e) => e.genderName ?? '')
            //           .toList() ??
            //       [],
            //   onChanged: controller.onSelectedGender,
            // ),
            CrmWidgetBuildFormTextFieldSelection(
              title: 'crm.account.gender'.tr,
              controller: controller.genderController,
              onPress: controller.onSelectedGender,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.contact.title_name'.tr,
              name: 'salutation',
              initialValue: controller.indexSalutation,
              items: controller.crmMasterData?.listSalutation
                      ?.map((e) => e.salutationName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSalutation,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.account.email'.tr,
              name: 'email',
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.contact.position'.tr,
              name: 'position',
              controller: controller.positionController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.company'.tr,
              name: 'crm.lead.company'.tr,
              controller: controller.companyController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.account.bussinessfiled'.tr,
              name: 'bussinessfiled',
              initialValue: controller.indexIndustry,
              items: controller.crmMasterData?.listIndustry
                      ?.map((e) => e.industryName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedIndustry,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildCombobox(
              title: 'crm.lead.source'.tr,
              name: 'crm.lead.source'.tr,
              initialValue: controller.indexSource,
              items: controller.crmMasterData?.leadSources
                      ?.map((e) => e.leadSourceName ?? '')
                      .toList() ??
                  [],
              onChanged: controller.onSelectedSource,
              isRequired: true,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.source.description'.tr,
              name: 'crm.lead.source.description'.tr,
              controller: controller.sourceDescriptionController,
              textInputType: TextInputType.text,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadAddress() {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        iconPadding: EdgeInsets.all(20),
        expandIcon: Icons.expand_more,
        collapseIcon: Icons.expand_more,
      ),
      header: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Text('crm.lead.address'.tr, style: AppTextStyle.heavy()),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        color: AppColor.primaryBackgroundColor,
        child: Column(
          children: [
            CrmWidgetBuildFormTextFieldSelection(
              title: 'crm.account.address.type'.tr,
              controller: controller.accountAddressTypeController,
              onPress: controller.onSelectedAddressType,
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextFieldSelection(
              title: 'crm.account.country'.tr,
              controller: controller.countryController,
              onPress: controller.onSelectedCountry,
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
      ),
    );
  }

  Widget _buildLeadAdditional() {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        iconPadding: EdgeInsets.all(20),
        expandIcon: Icons.expand_more,
        collapseIcon: Icons.expand_more,
      ),
      header: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Text('crm.lead.additional'.tr, style: AppTextStyle.heavy()),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        color: AppColor.primaryBackgroundColor,
        child: Column(
          children: [
            Obx(
              () => CrmWidgetFormLabelBox(
                label: 'crm.lead.product.care'.tr,
                text: controller.products
                    .map((element) => element.getTitle())
                    .join(', '),
                onPress: controller.onLeadProduct,
              ),
            ),
            const SizedBox(height: 10),
            CrmWidgetBuildFormTextField(
              title: 'crm.lead.descrip'.tr,
              name: 'description',
              controller: controller.descriptionController,
              textInputType: TextInputType.text,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: WidgetButton(
                title: 'cancel'.tr,
                textButtonColor: AppColor.primaryButtonColor,
                backgroundButtonColor: AppColor.primaryBackgroundColor,
                onPressed: controller.onCancel,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetButton(
                title: 'save'.tr,
                onPressed: controller.onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
