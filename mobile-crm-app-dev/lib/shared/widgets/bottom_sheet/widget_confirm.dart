import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/widget_button.dart';
import '../button/widget_text_button.dart';
import '../image_widget/fcore_image.dart';

class WidgetConfirm extends StatelessWidget {
  const WidgetConfirm({
    Key? key,
    required this.message,
    required this.title,
    required this.onAccept,
    required this.onCancel,
    this.positive,
    this.negative,
  }) : super(key: key);

  final String message;
  final String title;
  final String? positive;
  final String? negative;
  final Function() onAccept;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: AppColor.primaryBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38.0,
              height: 3.0,
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: AppColor.neutral8,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  title,
                  style: AppTextStyle.heavy(),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: Get.back,
                  child: FCoreImage(IconConstants.iconClose),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: AppTextStyle.regular(color: AppColor.thirdTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: WidgetButton(
                    title: positive ?? 'accept'.tr,
                    onPressed: onAccept,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: WidgetTextButton(
                  title: negative ?? 'cancel'.tr,
                  textButtonColor: AppColor.primaryColor,
                  onPressed: onCancel,
                ))
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
