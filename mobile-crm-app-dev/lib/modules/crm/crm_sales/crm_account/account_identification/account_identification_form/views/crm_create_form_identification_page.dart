import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox_is_req.dart';
import '../../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../controllers/crm_create_form_identification_controllers.dart';

class CrmCreateFormIdentificationPage
    extends GetView<CrmCreateFormIdentificationController> {
  const CrmCreateFormIdentificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'crm.account.create.new'.tr,
          style: AppTextStyle.regular(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 18,
            )),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        'crm.account.identification'.tr,
                        style: AppTextStyle.bold(fontSize: 20),
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildComboboxIsRequired(
                      title: 'crm.account.kind.of.papers'.tr,
                      name: 'kindOfPaper'),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                    title: 'crm.account.number.of.papers'.tr,
                    name: 'numberOfPaper',
                    controller: null,
                    textInputType: TextInputType.name,
                    isRequired: true,
                  ),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'crm.account.date.range'.tr,
                      name: 'date',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'crm.account.place'.tr,
                      name: 'place',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(height: 10),
                  CrmWidgetBuildFormTextField(
                      title: 'crm.account.note'.tr,
                      name: 'note',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: null,
                          child: Text(
                            'crm.account.identification.upload'.tr,
                            style: AppTextStyle.regular(color: Colors.blue),
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 10,
                    color: Colors.grey.shade100,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
