import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../services/user_info_service.dart';
import '../utils/dialog_util.dart';
import 'dialog/widget_view_user_profile.dart';
import 'widget_avatar.dart';

class WidgetUserAvatar extends StatelessWidget {
  final double size;
  final double border;
  final String avatar;
  final String name;
  final String userId;

  WidgetUserAvatar(
      {Key? key,
      this.size = 40,
      this.border = 0,
      required this.avatar,
      required this.name,
      required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onUserAvatar,
      child: WidgetAvatar(
        size: size,
        border: border,
        isUrl: true,
        avatar: avatar,
        name: name,
      ),
    );
  }

  /* Action */

  Future _onUserAvatar() async {
    await EasyLoading.show();
    final userInfo = await UserInfoService.getUserProfileHCMFromId(
      userId,
      isCache: false,
      onError: (message) {
        printError(info: message);
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: message);
      },
      onMappingError: (message) {
        printError(info: message);
      },
    );
    await EasyLoading.dismiss();
    if (userInfo != null) {
      await WidgetViewUserProfile.showUserProfile(userInfo);
    }
  }
}
