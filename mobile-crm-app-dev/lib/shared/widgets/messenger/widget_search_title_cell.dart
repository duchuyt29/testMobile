import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class WidgetSearchTitleCell extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const WidgetSearchTitleCell(this.title, {Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.heavy(
              color: AppColor.fourthTextColor,
              fontSize: 14,
            ),
          ),
          onPressed != null
              ? TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'view.all'.tr,
                    style: AppTextStyle.heavy(
                      color: AppColor.eightTextColorLight,
                      fontSize: 14,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
