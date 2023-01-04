import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controller/creat_my_request_next_controller.dart';

class CrmCreateMyRequestNextPage
    extends GetView<CrmCreateMyRequestNextController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.create.request'.tr,
          style: AppTextStyle.heavy(fontSize: 24),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 18,
          ),
        ),
        actions: [
          TextButton(
              onPressed: null,
              child: Text(
                'Lưu',
                style: AppTextStyle.heavy(fontSize: 20, color: Colors.black),
              ))
        ],
      ),
      drawer: CrmDrawer(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(child: _buildBodyContent()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      'workplace.workgroup.request.next.job'.tr,
                      style: AppTextStyle.heavy(
                          fontSize: 20, color: const Color(0xff858C94)),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                _buildItem(title: 'workplace.workgroup.name.job'.tr),
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
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: AppTextStyle.regular(
                                    color: AppColor.thirdTextColor),
                                children: [
                                  TextSpan(
                                      text:
                                          'workplace.workgroup.request.approval.method'
                                              .tr,
                                      style: AppTextStyle.heavy(
                                          fontSize: 18,
                                          color: const Color(0xff858C94))),
                                  TextSpan(
                                    text: '*',
                                    style: AppTextStyle.heavy(
                                        color: AppColor.errorColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 1,
                        right: 24,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyle.regular(
                              color: AppColor.thirdTextColor),
                          children: [
                            TextSpan(
                                text:
                                    'workplace.workgroup.request.responsile'.tr,
                                style: AppTextStyle.heavy(
                                    fontSize: 18,
                                    color: const Color(0xff858C94))),
                            TextSpan(
                              text: '*',
                              style: AppTextStyle.heavy(
                                  color: AppColor.errorColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildComboBox(name: '', title: ''),
                  ],
                ),
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
                  fontSize: 18, color: const Color(0xff858C94)),
            )),
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
            padding: const EdgeInsets.only(left: 10, right: 24, bottom: 0),
            child: WidgetInputLabel(
              label: title,
            )),
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
