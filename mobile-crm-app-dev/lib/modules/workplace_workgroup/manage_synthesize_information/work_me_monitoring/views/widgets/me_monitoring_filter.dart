import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';

class MeMonitoringFilterPage extends StatelessWidget {
  const MeMonitoringFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.90,
      backgroundColor: const Color(0xff493083),
      child: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.cancel),
              iconSize: 30,
              color: const Color(0xffFFFFFF),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'workplace.workgroup.filter.infor'.tr,
                  style: AppTextStyle.bold(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildFormContent(),
              const SizedBox(
                height: 200,
              ),
              _buildButtonSave(),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          FormBuilder(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildComboBox(
                    title: 'workplace.workgroup.source.work'.tr, name: ''),
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
                        'workplace.workgroup.petitioner'.tr,
                        style: AppTextStyle.heavy(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                    ),
                  ],
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
                      child: Text(
                        'workplace.workgroup.person.responsible.handler'.tr,
                        style: AppTextStyle.heavy(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: _buildItem(
                            title: 'workplace.workgroup.day.success.from'.tr)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: _buildItem(
                            title: 'workplace.workgroup.day.success.come'.tr))
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
          height: 10,
        ),
        FormBuilderTextField(
          name: 'name',
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.date_range_outlined,
              color: Colors.grey,
              size: 26,
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
