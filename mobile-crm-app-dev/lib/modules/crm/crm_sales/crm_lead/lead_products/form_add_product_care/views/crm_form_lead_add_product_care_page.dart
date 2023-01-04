import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../controllers/crm_form_lead_add_product_care_controllers.dart';

class CrmCreateFormLeadAddProductCarePage
    extends GetView<CrmCreateFormLeadAddProductCareController> {
  const CrmCreateFormLeadAddProductCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.product.care.add'.tr,
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
                children: [
                  const SizedBox(height: 10),
                  Obx(() => CrmWidgetFormLabelBox(
                        label: 'crm.lead.product'.tr,
                        text: controller.name.value,
                        onPress: controller.loadEmployee,
                        isRequired: true,
                      )),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return SafeArea(
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
                onPressed: controller.onSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             padding: const EdgeInsets.symmetric(vertical: 15),
    //             primary: Colors.white,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(5),
    //             ),
    //           ),
    //           onPressed: Get.back,
    //           child: Text(
    //             'crm.contact.cancel'.tr,
    //             style: AppTextStyle.regular(fontSize: 18, color: Colors.grey),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(width: 15),
    //       Expanded(
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             padding: const EdgeInsets.symmetric(vertical: 15),
    //             primary: AppColor.primaryColor,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(5),
    //             ),
    //           ),
    //           onPressed: () {
    //             controller.onSubmitted();
    //             //Get.toNamed(CRMRoutes.CRM_LEAD_CREATE_FORM_ADDITIONAL);
    //           },
    //           child: Text(
    //             'save'.tr,
    //             style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
