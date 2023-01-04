import 'package:flutter/material.dart';
import 'widget_input_label.dart';

class CrmWidgetFormLabelBox extends StatelessWidget {
  final String label;
  final String text;
  final bool enable;
  final bool showIcon;
  final Widget? icon;
  final bool disable;
  final bool isRequired;
  final Function()? onPress;

  const CrmWidgetFormLabelBox({
    Key? key,
    required this.label,
    required this.text,
    this.enable = true,
    this.onPress,
    this.showIcon = true,
    this.icon,
    this.disable = false,
    this.isRequired = false,
  }) : super(key: key);

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
              label: label,
              isRequired: isRequired,
            ),
          ),
          InkWell(
            onTap: disable ? null : onPress,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: disable
                                  ? Colors.grey.shade400
                                  : Colors.black),
                        ),
                      ),
                    ),
                    showIcon
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: icon ??
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: disable
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade700,
                                ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
