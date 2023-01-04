import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/base_controller.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'bottom_sheet_util.dart';

class ImagePickerUtil extends BaseController {
  static const int image = 1;
  static const int video = 2;

  static Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Icon(Icons.camera_alt),
              ),
              title: Text(
                'camera'.tr,
                style: AppTextStyle.regular(),
              ),
              onTap: () => Get.back(result: ImageSource.camera),
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Icon(Icons.image),
              ),
              title: Text(
                'gallery'.tr,
                style: AppTextStyle.regular(),
              ),
              onTap: () => Get.back(result: ImageSource.gallery),
            )
          ],
        ),
      ),
    );
  }

  static Future<int?> showSelectMediaType() async {
    // await BottomSheetUtil.showBottomSheet(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       ListTile(
    //         leading: const Icon(Icons.image_outlined),
    //         title: Text(
    //           'gallery.image'.tr,
    //           style: AppTextStyle.regular(),
    //         ),
    //         onTap: () => Get.back(result: ImagePickerUtil.image),
    //       ),
    //       ListTile(
    //         leading: const Icon(Icons.video_camera_back_outlined),
    //         title: Text(
    //           'gallery.video'.tr,
    //           style: AppTextStyle.regular(),
    //         ),
    //         onTap: () => Get.back(result: ImagePickerUtil.video),
    //       )
    //     ],
    //   ),
    //   onVaLue: (value) {
    //     return value;
    //   },
    // );
    // return null;
    return showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheet(
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.image_outlined),
                    title: Text(
                      'gallery.image'.tr,
                      style: AppTextStyle.regular(),
                    ),
                    onTap: () => Get.back(result: ImagePickerUtil.image),
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_camera_back_outlined),
                    title: Text(
                      'gallery.video'.tr,
                      style: AppTextStyle.regular(),
                    ),
                    onTap: () => Get.back(result: ImagePickerUtil.video),
                  )
                ],
              ),
            );
          },
          onClosing: () {},
          backgroundColor: AppColor.primaryBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(16),
              topStart: Radius.circular(16),
            ),
          ),
        );
      },
    );
  }
}
