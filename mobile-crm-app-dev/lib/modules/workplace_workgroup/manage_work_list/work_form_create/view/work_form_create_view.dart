import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/work_form_create_controller.dart';

class WorkFormCreatePage extends GetView<WorkFormCreateController> {
  const WorkFormCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.add.job'.tr,
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

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          FormBuilder(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildItemRequired(title: 'Tên'),
                const SizedBox(
                  height: 10,
                ),
                _buildComboBoxRequired(
                    title: 'workplace.workgroup.belonging'.tr, name: ''),
                const SizedBox(
                  height: 10,
                ),
                _buildComboBox(
                    title: 'workplace.workgroup.kindOfWork'.tr, name: ''),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 1, right: 24, bottom: 8),
                        child: Text(
                          'workplace.workgroup.content'.tr,
                          style: AppTextStyle.heavy(
                              fontSize: 16, color: const Color(0xff858C94)),
                        )),
                    FormBuilderTextField(
                      maxLines: 3,
                      name: 'name',
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildComboBoxRequired(
                          title: 'workplace.workgroup.request.responsile'.tr,
                          name: ''),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: _buildComboBoxRequired(
                          title: 'workplace.workgroup.day.start'.tr, name: ''),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: _buildItemRequired(
                            title: 'workplace.workgroup.times.success'.tr)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _buildItem(title: 'Giờ dự kiến')),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _buildItem({required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(
              left: 1,
            ),
            child: Text(
              title,
              style: AppTextStyle.heavy(
                  fontSize: 15, color: const Color(0xff858C94)),
            )),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'name',
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
        ),
      ],
    );
  }

  Column _buildItemRequired({required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 1,
          ),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.regular(color: AppColor.thirdTextColor),
              children: [
                TextSpan(
                  text: title,
                  style: AppTextStyle.heavy(
                    fontSize: 15,
                    color: const Color(0xff858C94),
                  ),
                ),
                TextSpan(
                  text: '*',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'name',
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
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
    );
  }

  Widget _buildComboBox({
    required String title,
    required String name,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 1, right: 24, bottom: 0),
            child: Text(
              title,
              style: AppTextStyle.heavy(
                  fontSize: 15, color: const Color(0xff858C94)),
            )),
        const SizedBox(
          height: 10,
        ),
        FormBuilderDropdown(
          name: name,
          items: const [
            DropdownMenuItem(
              value: '1',
              child: Text('1'),
            ),
            DropdownMenuItem(
              value: '2',
              child: Text('2'),
            ),
          ],
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'crm.validation.required'.tr),
          ]),
        )
      ],
    );
  }

  Widget _buildComboBoxRequired({
    required String title,
    required String name,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1, right: 24, bottom: 0),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.regular(color: AppColor.thirdTextColor),
              children: [
                TextSpan(
                  text: title,
                  style: AppTextStyle.heavy(
                    fontSize: 15,
                    color: const Color(0xff858C94),
                  ),
                ),
                TextSpan(
                  text: '*',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderDropdown(
          name: name,
          items: const [
            DropdownMenuItem(
              value: '1',
              child: Text('1'),
            ),
            DropdownMenuItem(
              value: '2',
              child: Text('2'),
            ),
          ],
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'crm.validation.required'.tr),
          ]),
        )
      ],
    );
  }
}
