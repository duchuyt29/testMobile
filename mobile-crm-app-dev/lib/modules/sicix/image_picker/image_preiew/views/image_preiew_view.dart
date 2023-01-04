import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/image_preiew_controller.dart';

class ImagePreiewView extends GetView<ImagePreiewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.name ?? 'photo'.tr,
          style: AppTextStyle.heavy(color: AppColor.secondTextColor),
        ),
        actions: [
          TextButton(
            onPressed: controller.onSave,
            child: Text(
              'save'.tr,
              style: AppTextStyle.heavy(color: AppColor.secondTextColor),
            ),
          )
        ],
      ),
      body: _buidlBodyContent(),
    );
  }

  Widget _buidlBodyContent() {
    return PhotoView(
      imageProvider: NetworkImage(controller.image ?? ''),
      loadingBuilder: (context, event) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
