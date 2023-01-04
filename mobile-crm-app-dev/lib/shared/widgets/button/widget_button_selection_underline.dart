import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class WidgetButtonSelectionUnderline extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  WidgetButtonSelectionUnderline(
      {Key? key, required this.title, required this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyle.heavy(
                fontSize: 16,
                color: isSelected
                    ? AppColor.sixTextColorLight
                    : AppColor.primaryHintColor,
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              height: isSelected ? 2 : 1,
              thickness: isSelected ? 2 : 1,
              color: isSelected ? AppColor.primaryColor : AppColor.dividerColor,
            )
          ],
        ),
      ),
    );
  }
}
