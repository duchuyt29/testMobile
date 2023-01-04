import 'package:flutter/cupertino.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class WidgetInputLabel extends StatelessWidget {
  const WidgetInputLabel(
      {Key? key, required this.label, this.isRequired = false})
      : super(key: key);

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return RichText(
        text: TextSpan(
          style: AppTextStyle.regular(color: AppColor.thirdTextColor),
          children: [
            TextSpan(
              text: '* ',
              style: AppTextStyle.heavy(color: AppColor.errorColor),
            ),
            TextSpan(text: label, style: AppTextStyle.regular()),
          ],
        ),
      );
    }
    return RichText(
      text: TextSpan(text: label, style: AppTextStyle.regular()),
    );
  }
}
