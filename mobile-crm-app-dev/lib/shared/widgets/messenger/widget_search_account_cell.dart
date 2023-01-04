import 'package:flutter/material.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';
import '../widget_avatar.dart';

class WidgetSearchAccountCell extends StatelessWidget {
  final String avatar;
  final String name;
  final bool? isSelected;
  final GestureTapCallback onTap;

  const WidgetSearchAccountCell(
      {Key? key,
      required this.avatar,
      required this.name,
      this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            isSelected == null
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: FCoreImage(
                      isSelected!
                          ? IconConstants.icRadioOn1
                          : IconConstants.icRadioOff1,
                      width: 24,
                    ),
                  ),
            WidgetAvatar(
              size: 64,
              name: name,
              avatar: avatar,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                name,
                maxLines: 2,
                style: AppTextStyle.heavy(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
