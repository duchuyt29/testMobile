import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'widget_input_label.dart';

// ignore: must_be_immutable
class CrmWidgetBuildFormDateField extends StatelessWidget {
  CrmWidgetBuildFormDateField({
    Key? key,
    required this.title,
    required this.controller,
    required this.selectDate,
    this.enable = true,
    this.isRequired = false,
  }) : super(key: key);

  final bool enable;
  final String title;
  final TextEditingController controller;
  final VoidCallback selectDate;
  bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: title,
              isRequired: isRequired,
            )),
        FormBuilderTextField(
          enabled: enable,
          name: title,
          controller: controller,
          readOnly: true,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            suffixIcon: Icon(Icons.calendar_month_outlined),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: FormBuilderValidators.compose(
            [
              if (isRequired)
                FormBuilderValidators.required(
                    errorText: 'crm.validation.required'.tr),
            ],
          ),
          onTap: selectDate,
        ),
      ],
    );
  }
}
