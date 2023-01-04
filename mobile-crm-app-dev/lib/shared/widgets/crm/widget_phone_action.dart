import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/text_style/text_style.dart';

class CrmWidgetPhoneAction extends StatelessWidget {
  const CrmWidgetPhoneAction({
    Key? key,
    this.label,
    required this.title,
    required this.onTap,
    this.padding,
    this.decoration,
  }) : super(key: key);

  final String? label;
  final String title;
  final EdgeInsetsGeometry? padding;
  final Function() onTap;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 155, child: Text(label ?? 'phone.number'.tr)),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                title,
                style: AppTextStyle.regular(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
