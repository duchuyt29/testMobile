import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/utils/image_picker_util.dart';

class ImagePickerController extends BaseController {
  final imageFiles = RxList<AssetEntity>.empty();

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _getImageList();
  }

  /* Action */
  Future<void> onAlbum() async {
    final imageSource = await ImagePickerUtil.showSelectMediaType();
    if (imageSource == ImagePickerUtil.image) {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        await _handleImage(File(image.path));
      }
    } else if (imageSource == ImagePickerUtil.video) {
      final image = await _imagePicker.pickVideo(source: ImageSource.gallery);
      if (image != null) {
        await _handleImage(File(image.path));
      }
    }
  }

  Future<void> onCamera() async {
    final image = await _imagePicker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (image != null) {
      await _handleImage(File(image.path));
    }
  }

  Future<void> onPhoto(AssetEntity entity) async {
    await entity.file.then((file) async {
      if (file != null) {
        await _handleImage(file);
      }
    });
  }

  /* Function */

  Future<void> _getImageList() async {
    await EasyLoading.show();
    final paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      filterOption: FilterOptionGroup(
        imageOption: const FilterOption(
          sizeConstraint: SizeConstraint(ignoreSize: true),
        ),
      ),
    );
    if (paths.isEmpty) {
      await EasyLoading.dismiss();
      return;
    }
    final entities = await paths.first.getAssetListPaged(
      page: 0,
      size: 50,
    );
    await EasyLoading.dismiss();
    imageFiles.addAll(entities);
  }

  Future<void> _handleImage(File image) async {
    // final fileCompressed = await _compressFile(image);
    // Get.back(result: fileCompressed ?? image);
    Get.back(result: image);
  }

  Future<File?> _compressFile(File file) async {
    final filePath = file.absolute.path;

    final lastIndex = filePath.lastIndexOf('.');
    final splitted = filePath.substring(0, lastIndex);
    final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
    final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, outPath,
        quality: 50);

    printInfo(info: file.lengthSync().toString());
    printInfo(info: result?.lengthSync().toString() ?? '');

    return result;
  }
}
