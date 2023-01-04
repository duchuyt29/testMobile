import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetSearchResultCell extends StatelessWidget {
  final GestureTapCallback onTap;

  const WidgetSearchResultCell({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: FCoreImage(
                ImageConstants.appIcon,
                width: 64,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Võ Nguyễn Hoàng Anh',
                    maxLines: 1,
                    style: AppTextStyle.heavy(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'That\'s awesome!',
                    maxLines: 1,
                    style: AppTextStyle.regular(
                      color: AppColor.niceTextColorLight,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Text(
              '20:00',
              style: AppTextStyle.regular(
                color: AppColor.niceTextColorLight,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
