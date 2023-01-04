import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/crm/widget_title_component.dart';
import '../../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controller/convert_lead_controller.dart';

class ConvertLeadScreen extends GetView<ConvertLeadController> {
  const ConvertLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.convert'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
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
          CrmWidgetTitleComponent(title: 'crm.lead.account.information'.tr),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Obx(
              () => CrmWidgetFormLabelBox(
                label: 'crm.lead.account'.tr,
                isRequired: true,
                text: controller.activityAccount.value?.accountName ??
                    controller.leadConvertRequest.value.accountName ??
                    '',
                icon: const Icon(Icons.search),
                onPress: controller.onSearchAccount,
              ),
            ),
          ),
          CrmWidgetTitleComponent(title: 'crm.opportunity.info'.tr),
          _buildOpportunityInfo(),
          CrmWidgetTitleComponent(
              title: 'crm.lead.account.contact.information'.tr),
          _buildAccountContact(),
        ],
      ),
    );
  }

  Widget _buildOpportunityInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          CrmWidgetBuildCombobox(
            title: 'crm.opportunity.stage'.tr,
            name: 'crm.opportunity.stage',
            initialValue: controller.indexOpportunity,
            items: controller.crmMasterData?.listOpportunityStage
                    ?.map((e) => e.opportunityStageName ?? '')
                    .toList() ??
                [],
            onChanged: controller.onSelectedOpportunity,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildCombobox(
            title: 'crm.price.currency'.tr,
            name: 'crm.price.currency',
            initialValue: controller.indexCurrency,
            items: controller.crmMasterData?.listCurrencyExchangeRate
                    ?.map((e) => e.currencyName ?? '')
                    .toList() ??
                [],
            onChanged: controller.onSelectedOpportunity,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          CrmWidgetBuildFormDateField(
            title: 'crm.activity.day.start.come'.tr,
            controller: controller.startDateController,
            selectDate: () => controller.onSelectStartDate(),
            isRequired: true,
          ),
          const SizedBox(height: 10),
          Obx(
            () => CrmWidgetFormLabelBox(
              label: 'Nhân viên phụ trách',
              text: controller.employeeInCharge.value?.getFullname() ?? '',
              onPress: controller.onEmployeeInCharge,
              isRequired: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountContact() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          CrmWidgetFormLabelBox(
            label: 'Liên hệ',
            text: controller.accountContact.value?.contactName ?? '',
            onPress: controller.onAccountContact,
          ),
          const SizedBox(height: 10),
          CrmWidgetFormLabelBox(
            label: 'relationship'.tr,
            text:
                controller.accountContact.value?.accountRelationTypeName ?? '',
            disable: true,
            showIcon: false,
          ),
        ],
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
