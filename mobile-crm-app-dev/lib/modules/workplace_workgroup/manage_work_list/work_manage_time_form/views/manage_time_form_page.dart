import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/manage_time_form_controller.dart';

class ManageTimeFormPage extends GetView<ManageTimeFormController> {
  ManageTimeFormPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.add.timesheet'.tr,
          style: AppTextStyle.heavy(fontSize: 22, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: Get.back,
        ),
        actions: [
          TextButton(
              onPressed: controller.onSubmitted,
              child: Text(
                'Lưu',
                style: AppTextStyle.heavy(fontSize: 22, color: Colors.white),
              ))
        ],
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFormContent(),
            ],
          ),
        ))
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
                const SizedBox(height: 10),
                _buildFormTextFeild(title: 'Tên công việc'),
                _buildFormTextFeild(title: 'Ngày thực hiện'),
                _buildFormTextFeild(title: 'Số giờ'),

                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tăng ca',
                        style: AppTextStyle.regular(
                            color: const Color(0xff858C94), fontSize: 22),
                      ),
                      // const SizedBox(width: 15),
                      Row(
                        children: [
                          Obx(
                            () => FlutterSwitch(
                              activeColor: Colors.green,
                              value: controller.checkStatus.value,
                              onToggle: (val) {
                                controller.onToggle(val);
                                if (val) {
                                  const Text('aaaaaa');
                                } else {
                                  Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        _buildFormTextFeild(
                                            title: 'Bắt đầu OT'),
                                        _buildFormTextFeild(
                                            title: 'Kết thúc OT'),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buildFormTextFeild(title: 'Bắt đầu OT'),
                _buildFormTextFeild(title: 'Kết thúc OT'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 24, bottom: 8),
                        child: Text(
                          'Số giờ OT',
                          style: AppTextStyle.regular(
                              color: const Color(0xff858C94)),
                        )),
                    FormBuilderTextField(
                      enabled: false,
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
                const SizedBox(height: 10),
                // build single choice dialog
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _buildFormTextFeild({
    required String title,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 10, right: 24, bottom: 8),
            child: Text(
              title,
              style: AppTextStyle.regular(color: const Color(0xff858C94)),
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
}
