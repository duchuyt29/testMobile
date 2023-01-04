import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../controller/workplace_dashboard_addmeet_controller.dart';

class WorkPlaceDashBoardAddMeetPage
    extends GetView<WorkPlaceDashBoardAddMeetingController> {
  const WorkPlaceDashBoardAddMeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.90,
      backgroundColor: Colors.blue,
      child: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const SizedBox(height: 50),
        Container(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.cancel),
                iconSize: 30,
                color: const Color(0xffFFFFFF),
              ),
              const SizedBox(width: 90),
              Text(
                'workplace.workgroup.meeting.create'.tr,
                style: AppTextStyle.bold(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            _buildFormContent(),
            const SizedBox(
              height: 70,
            ),
            _buildButtonSave(),
          ],
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildItem(title: 'workplace.workgroup.meeting.name'.tr),
                const SizedBox(
                  height: 20,
                ),
                _buildItem(title: 'workplace.workgroup.meeting.project'.tr),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 1,
                      ),
                      child: Text(
                        'workplace.workgroup.meeting.day'.tr,
                        style: AppTextStyle.heavy(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 1,
                            ),
                            child: Text(
                              'workplace.workgroup.times.begin'.tr,
                              style: AppTextStyle.heavy(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FormBuilderTextField(
                            name: 'name',
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.watch_later_outlined),
                              fillColor: Colors.white,
                              filled: true,
                              errorStyle: TextStyle(height: 0),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 1,
                            ),
                            child: Text(
                              'workplace.workgroup.times.end'.tr,
                              style: AppTextStyle.heavy(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FormBuilderTextField(
                            name: 'name',
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.watch_later_outlined),
                              fillColor: Colors.white,
                              filled: true,
                              errorStyle: TextStyle(height: 0),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
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
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
            style: AppTextStyle.heavy(fontSize: 16, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FormBuilderTextField(
          name: 'name',
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
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
                'Áp dụng',
                style: AppTextStyle.bold(
                  fontSize: 16,
                  color: const Color(0xff493083),
                ),
              ),
            ),
          ),
        ],
      ),
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
          padding: const EdgeInsets.only(
            left: 1,
          ),
          child: Text(
            title,
            style: AppTextStyle.heavy(fontSize: 16, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 15,
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
            fillColor: Colors.white,
            filled: true,
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
