import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/widget_button.dart';
import '../button/widget_text_button.dart';

class WidgetContactAdmin extends StatelessWidget {
  final String title;
  final String message;

  const WidgetContactAdmin(
      {Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.heavy(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTextStyle.regular(color: AppColor.fourthTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                child: WidgetButton(
                  title: 'confirm'.tr,
                  onPressed: Get.back,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: WidgetTextButton(
                  title: 'close'.tr,
                  onPressed: Get.back,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
