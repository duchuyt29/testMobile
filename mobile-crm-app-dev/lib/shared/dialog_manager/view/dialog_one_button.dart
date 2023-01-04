import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class DialogOneButton extends StatelessWidget {
  const DialogOneButton({
    required this.onPressed,
    this.title,
    required this.content,
    this.textButton,
  });

  final VoidCallback onPressed;
  final String? title;
  final String content;
  final String? textButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? 'info'.tr,
        style: AppTextStyle.heavy(),
      ),
      content: Text(
        content,
        style: AppTextStyle.regular(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: const Size(100, 50),
            padding: EdgeInsets.zero,
            backgroundColor: AppColor.primaryColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            textButton == null ? 'ok'.tr : textButton!,
            style: AppTextStyle.heavy(
              color: AppColor.secondTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
