import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'widget_input_label.dart';

class CrmWidgetBuildFormTextFieldSelection extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final bool enable;
  final bool showIcon;
  final Widget? icon;
  final bool disable;
  final bool isRequired;
  final Function()? onPress;

  const CrmWidgetBuildFormTextFieldSelection({
    Key? key,
    required this.title,
    required this.controller,
    this.enable = true,
    this.onPress,
    this.showIcon = true,
    this.icon,
    this.disable = false,
    this.isRequired = false,
  }) : super(key: key);

  @override
  State<CrmWidgetBuildFormTextFieldSelection> createState() =>
      _CrmWidgetBuildFormTextFieldSelectionState();
}

class _CrmWidgetBuildFormTextFieldSelectionState
    extends State<CrmWidgetBuildFormTextFieldSelection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 8),
            child: WidgetInputLabel(
              label: widget.title,
              isRequired: widget.isRequired,
            ),
          ),
          FormBuilderTextField(
            name: widget.title,
            controller: widget.controller,
            readOnly: true,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              suffixIcon: widget.showIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: widget.icon ??
                          Icon(
                            Icons.arrow_drop_down,
                            color: widget.disable
                                ? Colors.grey.shade400
                                : Colors.grey.shade700,
                          ),
                    )
                  : null,
            ),
            validator: FormBuilderValidators.compose(
              [
                if (widget.isRequired)
                  FormBuilderValidators.required(
                      errorText: 'crm.validation.required'.tr),
              ],
            ),
            onTap: widget.disable ? null : widget.onPress,
          ),
        ],
      ),
    );
  }
}
