import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/image_picker_controller.dart';

class ImagePickerScreen extends GetView<ImagePickerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.canvasColor,
            )),
        title: Text(
          'picker.recent.photos'.tr,
          style: AppTextStyle.heavy(color: AppColor.secondTextColor),
        ),
        actions: [
          TextButton(
            onPressed: controller.onAlbum,
            child: Text(
              'album'.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.heavy(color: AppColor.secondTextColor),
            ),
          )
        ],
      ),
      body: _buidlBodyContent(),
    );
  }

  Widget _buidlBodyContent() {
    return Obx(
      () => GridView.builder(
        itemCount: controller.imageFiles.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: controller.onCamera,
              child: Container(
                color: AppColor.secondBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FCoreImage(IconConstants.icCamera2),
                    const SizedBox(height: 5),
                    Text(
                      'camera'.tr,
                      textAlign: TextAlign.center,
                      style:
                          AppTextStyle.regular(color: AppColor.thirdTextColor),
                    ),
                  ],
                ),
              ),
            );
          }
          return InkWell(
            onTap: () => controller.onPhoto(controller.imageFiles[index - 1]),
            child: Stack(
              children: [
                AssetEntityImage(
                  controller.imageFiles[index - 1],
                  height: double.infinity,
                  width: double.infinity,
                  isOriginal: false,
                  fit: BoxFit.cover,
                ),
                if (AppUtil.isVideo(
                    controller.imageFiles[index - 1].title ?? ''))
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black45,
                      child: Icon(
                        Icons.play_arrow,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
