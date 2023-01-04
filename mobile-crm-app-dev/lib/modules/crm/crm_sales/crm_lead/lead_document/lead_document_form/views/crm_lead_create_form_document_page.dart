import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_lead_create_form_document_controllers.dart';

class CrmCreateFormLeadDocumentPage
    extends GetView<CrmCreateFormLeadDocumentController> {
  const CrmCreateFormLeadDocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'crm.lead.document.additional'.tr,
          style: AppTextStyle.regular(fontSize: 20),
        ),
      ),
      drawer: CrmDrawer(),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 1,
          color: const Color.fromARGB(255, 227, 227, 227),
        ),
        const SizedBox(height: 15),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFormContent(),
              _buildButtonSave(),
            ],
          ),
        ))
      ],
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
                controller.onSubmitted();
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
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.lead.document.file'.tr,
                    name: 'file',
                    controller: null,
                    textInputType: TextInputType.name,
                    isRequired: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(420, 45),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 135, 7)),
                    child: Text(
                      'Chọn tệp',
                      style: AppTextStyle.regular(
                          fontSize: 28, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.lead.document.name'.tr,
                    name: 'name',
                    controller: null,
                    textInputType: TextInputType.name,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.lead.document.version'.tr,
                    name: 'version',
                    controller: null,
                    textInputType: TextInputType.name,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 24, bottom: 8),
                          child: WidgetInputLabel(
                            label: 'crm.account.des'.tr,
                          )),
                      FormBuilderTextField(
                        name: 'accountDes',
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
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }
}
