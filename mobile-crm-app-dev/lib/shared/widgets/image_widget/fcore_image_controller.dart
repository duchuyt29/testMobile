import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../base/base_controller.dart';
import '../../../data/hive_database/dao/image_cache_dao.dart';
import '../../../data/hive_database/models/image_cache_model.dart';

class CacheImageController extends BaseController {
  RxString filename = ''.obs;
  ImageCacheDAO imageCacheDAO = Get.find<ImageCacheDAO>();

  Future<void> downloadFile(String imgUrl) async {
    final dio = Dio();
    final fileName = imgUrl.split('/').last;
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$fileName';
    filename.value = '';
    try {
      print(filePath);
      await dio.download(
        imgUrl,
        filePath,
        onReceiveProgress: (rec, total) {
          print('Rec: $rec , Total: $total');
        },
      );
      imageCacheDAO.add(ImageCacheModel(filePath: filePath, url: imgUrl));
      filename.value = fileName;
    } catch (e) {
      print(e);
    }
    print('Download completed');
  }
}
