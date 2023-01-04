import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'image_widget/fcore_image.dart';

class WidgetSearchEmpty extends StatelessWidget {
  final double? size;
  final String? message;

  WidgetSearchEmpty({Key? key, this.size, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          FCoreImage(
            IconConstants.icSearchEmpty,
            width: Get.width * 0.46,
          ),
          const SizedBox(height: 20),
          Text(
            message ?? 'messenger.search.empty'.tr,
            style: AppTextStyle.regular(
              color: AppColor.fourthTextColor,
              fontSize: 20,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
