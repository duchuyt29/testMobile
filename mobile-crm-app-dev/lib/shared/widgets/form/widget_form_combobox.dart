import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'widget_input_label.dart';

class CrmWidgetBuildCombobox extends StatefulWidget {
  final String title;
  final String name;
  final int? initialValue;
  final bool isRequired;
  final bool disable;
  final List<String> items;
  final ValueChanged<int> onChanged;

  CrmWidgetBuildCombobox({
    Key? key,
    required this.title,
    required this.name,
    required this.items,
    required this.onChanged,
    this.initialValue,
    this.isRequired = false,
    this.disable = false,
  }) : super(key: key);

  @override
  State<CrmWidgetBuildCombobox> createState() => _CrmWidgetBuildComboboxState();
}

class _CrmWidgetBuildComboboxState extends State<CrmWidgetBuildCombobox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 0, right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: widget.title,
              isRequired: widget.isRequired,
            )),
        FormBuilderDropdown<int>(
          name: widget.name,
          onChanged: (value) => widget.onChanged(value ?? 0),
          initialValue: widget.initialValue,
          enabled: !widget.disable,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
          ),
          validator: FormBuilderValidators.compose([
            if (widget.isRequired)
              FormBuilderValidators.required(
                  errorText: 'crm.validation.required'.tr),
          ]),
          items: Iterable<int>.generate(widget.items.length)
              .map((a) => DropdownMenuItem(
                    alignment: AlignmentDirectional.centerStart,
                    value: a,
                    child: Text(widget.items[a]),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
