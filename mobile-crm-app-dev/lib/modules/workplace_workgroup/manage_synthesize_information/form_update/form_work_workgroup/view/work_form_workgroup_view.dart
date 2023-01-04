import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/work_form_workgroup_controller.dart';

class WorkFormWorkgroupPage extends GetView<WorkFormWorkgroupController> {
  const WorkFormWorkgroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.edit.job'.tr,
          style: AppTextStyle.heavy(fontSize: 22, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Get.toNamed(
              //     WorkGroupRoutes.WORKPLACE_WORKGROUP_CREATE_MY_REQUEST_NEXT);
            },
            child: Text(
              'save'.tr,
              style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(child: _buildBodyContent()),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Column(
          children: [
            _buildFormContent(),
          ],
        )
      ],
    );
  }

  Widget _buildFormContent() {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('workplace.workgroup.state'.tr,
                              style: AppTextStyle.regular()),
                          const SizedBox(width: 25),
                          Container(
                            height: 37,
                            decoration: BoxDecoration(
                              color: const Color(0xffFD9E0F),
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FCoreImage(
                                    ImageConstants.workplaceWorkgroupCheck,
                                    height: 20,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'workplace.workgroup.processing'.tr,
                                    style:
                                        AppTextStyle.bold(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CrmWidgetBuildFormTextField(
                      isRequired: true,
                      title: 'workplace.workgroup.name.job'.tr,
                      name: '',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  CrmWidgetBuildCombobox(
                      title: 'workplace.workgroup.belonging'.tr,
                      name: '',
                      items: [],
                      onChanged: (id) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  CrmWidgetBuildCombobox(
                      title: 'workplace.workgroup.kindOfWork'.tr,
                      name: '',
                      items: [],
                      onChanged: (id) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  CrmWidgetBuildFormTextField(
                      maxLines: 3,
                      title: 'workplace.workgroup.note'.tr,
                      name: '',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  CrmWidgetBuildFormTextField(
                      isRequired: true,
                      title: 'workplace.workgroup.person.responsible'.tr,
                      name: '',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CrmWidgetBuildFormTextField(
                            isRequired: true,
                            title: 'workplace.workgroup.start'.tr,
                            name: '',
                            controller: null,
                            textInputType: TextInputType.name),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CrmWidgetBuildFormTextField(
                            isRequired: true,
                            title: 'workplace.workgroup.times.success'.tr,
                            name: '',
                            controller: null,
                            textInputType: TextInputType.name),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CrmWidgetBuildFormTextField(
                      title: 'workplace.workgroup.Estimated'.tr,
                      name: '',
                      controller: null,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
