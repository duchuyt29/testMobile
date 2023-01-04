import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class WidgetTextButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final Color? textButtonColor;
  final double fontSize;
  final VoidCallback? onPressed;

  const WidgetTextButton({
    Key? key,
    required this.title,
    this.width,
    this.height,
    this.fontSize = 18,
    this.onPressed,
    this.textButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          title,
          style: AppTextStyle.heavy(
            color: textButtonColor ?? AppColor.primaryButtonColor,
            fontSize: fontSize,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
