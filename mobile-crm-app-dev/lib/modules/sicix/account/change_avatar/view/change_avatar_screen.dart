import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_crop/image_crop.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../controller/change_avatar_controller.dart';

part 'change_avatar_extension.dart';

class ChangeAvatarScreen extends GetView<ChangeAvatarController> {
  const ChangeAvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: Container(
        color: AppColor.backgroundCropColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildUpdateAvatar(),
          ],
        ),
      ),
    );
  }
}
