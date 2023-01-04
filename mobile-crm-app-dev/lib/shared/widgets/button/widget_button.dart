import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class WidgetButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundButtonColor;
  final Color? textButtonColor;
  final double fontSize;
  final double? elevation;
  final VoidCallback? onPressed;

  const WidgetButton({
    Key? key,
    required this.title,
    this.width,
    this.height,
    this.margin,
    this.fontSize = 18,
    this.onPressed,
    this.backgroundButtonColor,
    this.textButtonColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 55,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundButtonColor ?? AppColor.primaryColor,
          onPrimary: backgroundButtonColor ?? AppColor.primaryColor,
          onSurface: backgroundButtonColor ?? AppColor.primaryColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.heavy(
            color: textButtonColor ?? AppColor.secondTextColor,
            fontSize: fontSize,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
