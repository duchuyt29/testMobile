import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';
import '../widget_avatar.dart';

class WidgetUserCreateChatCell extends StatelessWidget {
  final UserInfo userInfo;
  final bool isSelected;
  final Function(UserInfo) onSelection;

  const WidgetUserCreateChatCell(
    this.userInfo,
    this.isSelected, {
    Key? key,
    required this.onSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelection(userInfo),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            FCoreImage(
              isSelected ? IconConstants.icRadioOn1 : IconConstants.icRadioOff1,
              width: 24,
            ),
            const SizedBox(width: 12),
            WidgetAvatar(
              size: 64,
              name: userInfo.getName(),
              avatar: userInfo.getAvatar(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                userInfo.getName(),
                maxLines: 3,
                style: AppTextStyle.heavy(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
