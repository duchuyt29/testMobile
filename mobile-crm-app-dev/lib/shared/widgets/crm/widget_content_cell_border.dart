import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class WidgetContentCellBorder extends StatelessWidget {
  final String title;
  final String content;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapValue;

  const WidgetContentCellBorder(
    this.title,
    this.content, {
    Key? key,
    this.onTap,
    this.onTapValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    title,
                    style: AppTextStyle.regular(
                      color: onTap != null ? Colors.blue : null,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: GestureDetector(
                    onTap: onTapValue,
                    child: Text(
                      content,
                      style: AppTextStyle.regular(
                        color: onTapValue != null
                            ? Colors.blue
                            : AppColor.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
