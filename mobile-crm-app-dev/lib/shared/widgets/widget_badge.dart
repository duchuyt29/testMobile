import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';

class WidgeBadge extends StatelessWidget {
  final String badge;
  final EdgeInsetsGeometry? margin;

  const WidgeBadge(this.badge, {Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: margin,
      decoration: BoxDecoration(
        color: AppColor.badgeColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: AppColor.primaryBackgroundColor,
        ),
      ),
      child: Text(
        badge,
        style:
            AppTextStyle.heavy(color: AppColor.secondTextColor, fontSize: 11),
      ),
    );
  }
}
