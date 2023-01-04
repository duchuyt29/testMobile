import 'package:flutter/material.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'image_widget/fcore_image.dart';

class WidgetNotification extends StatelessWidget {
  const WidgetNotification({
    Key? key,
    required this.content,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.marginTop,
    this.marginBottom,
  }) : super(key: key);

  final String content;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? marginTop;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: marginTop ?? 24.0,
          bottom: marginBottom ?? 24.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        width: double.infinity,
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColor ?? AppColor.statusSuccessBG,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FCoreImage(
              IconConstants.iconAlertSuccess,
              color: iconColor ?? AppColor.statusSuccess,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Text(
                content,
                style: AppTextStyle.regular(
                  color: textColor ?? AppColor.statusSuccess,
                ),
              ),
            ),
            FCoreImage(
              IconConstants.iconClose,
              color: iconColor ?? AppColor.statusSuccess,
            )
          ],
        ),
      ),
    );
  }
}
