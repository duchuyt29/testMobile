import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controllers/crm_opportunity_additional_form_controller.dart';

class OpportunityAdditionalFormScreen
    extends GetView<OpportunityAdditionalFormController> {
  const OpportunityAdditionalFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.opportunity.additional.edit'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FormBuilder(
                key: controller.fbKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: WidgetInputLabel(
                                label: 'crm.product.product.desc'.tr,
                              )),
                          FormBuilderTextField(
                            name: 'description',
                            initialValue:
                                controller.opportunityInfo.value?.description,
                            maxLines: 5,
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
                    )
                  ],
                ),
              ),
            ),
          ),
          _buildButtonSave()
        ],
      )),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                backgroundColor: AppColor.primaryColor,
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
