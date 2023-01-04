import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../image_widget/fcore_image.dart';
import '../widget_avatar.dart';

class WidgetUserSelected extends StatelessWidget {
  final UserInfo userInfo;
  final VoidCallback onPressed;

  const WidgetUserSelected(
      {Key? key, required this.userInfo, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5),
          child: WidgetAvatar(
            size: 64,
            name: userInfo.getName(),
            avatar: userInfo.getAvatar(),
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: FCoreImage(
              IconConstants.icCancel,
              width: 24,
              height: 24,
            ),
          ),
        )
      ],
    );
  }
}
