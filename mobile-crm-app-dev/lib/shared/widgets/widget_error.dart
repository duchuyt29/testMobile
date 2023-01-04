import 'package:flutter/material.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'image_widget/fcore_image.dart';

class WidgetError extends StatelessWidget {
  final String error;

  const WidgetError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColor.errorBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Row(
        children: [
          FCoreImage(IconConstants.icError, width: 14),
          const SizedBox(width: 6),
          Expanded(child: Text(error, style: AppTextStyle.error())),
        ],
      ),
    );
  }
}
