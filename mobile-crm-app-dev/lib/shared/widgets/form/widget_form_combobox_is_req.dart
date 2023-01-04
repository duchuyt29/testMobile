import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'widget_input_label.dart';

class CrmWidgetBuildComboboxIsRequired extends StatelessWidget {
  CrmWidgetBuildComboboxIsRequired({
    Key? key,
    required this.title,
    required this.name,
    // required this.context
  }) : super(key: key);

  final String title;
  final String name;

  List<String> listDropDown = ['1', '2', '3', '4', '5', '6'];

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
              isRequired: true,
            )),
        FormBuilderDropdown<String>(
          name: name,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'crm.validation.required'.tr),
          ]),
          items: listDropDown
              .map((a) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: a,
                    child: Text(a),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
