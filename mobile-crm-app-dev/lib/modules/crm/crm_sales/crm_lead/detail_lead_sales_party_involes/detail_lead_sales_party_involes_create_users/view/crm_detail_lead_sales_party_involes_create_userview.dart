import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';

import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';

import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';

import '../../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_detail_lead_sales_party_involes_create_user_controllers.dart';

class CrmDetailLeadSalePartyInvolesCreateUserScreen
    extends GetView<CrmDetailLeadSalePartyInvolesCreateUsersController> {
  final controllerTest = TextEditingController();
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
      bottomNavigationBar: _buildButtonSave(),
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
        _buildFormContent(),
        const SizedBox(
          height: 300,
        ),
      ],
    );
  }

  Row _buildHeaderContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'crm.lead.add.sale.party.involed'.tr,
          style: AppTextStyle.regular(fontSize: 19),
        ),
      ],
    );
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
                const SizedBox(
                  height: 10,
                ),
                CrmWidgetBuildFormTextField(
                  title: 'crm.lead.subject'.tr,
                  name: 'crm.lead.subject'.tr,
                  controller: null,
                  textInputType: TextInputType.name,
                  isRequired: true,
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 1,
                      ),
                      child: WidgetInputLabel(
                        label: 'crm.account.name'.tr,
                        isRequired: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: controller.searchUsers,
                          icon: Icon(Icons.search),
                        ),
                        fillColor: Colors.white,
                        filled: true,
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
                ),
                const SizedBox(height: 20),
                CrmWidgetBuildCombobox(
                  title: 'crm.account.personal.role'.tr,
                  name: 'crm.account.personal.role'.tr,
                  items: [],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                primary: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                //controller.onSubmitted();
              },
              child: Text(
                'crm.contact.next'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
