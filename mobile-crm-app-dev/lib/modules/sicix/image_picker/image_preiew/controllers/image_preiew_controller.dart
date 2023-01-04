import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/constants/arguments.dart';

class ImagePreiewController extends BaseController {
  final String? name;
  final String? image;

  ImagePreiewController()
      : name = Get.arguments[NAME_ARGUMENT] as String?,
        image = Get.arguments[IMAGE_ARGUMENT] as String?;

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (image == null) {
      Get.back();
    }
  }

  /* Action */

  Future onSave() async {
    await EasyLoading.show();
    await ImageDownloader.downloadImage(image ?? '').then((value) {
      if (value != null) {
        EasyLoading.showToast('photo.download.success'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.showToast('photo.download.failed'.tr);
    });
  }
}
