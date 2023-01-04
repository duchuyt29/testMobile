import 'package:hive/hive.dart';

import 'models/image_cache_model.dart';

class HiveDatabase {
  late final Box<ImageCacheModel> imageCacheBox;
  final String path;

  HiveDatabase(this.path);

  Future<void> init() async {
    Hive
      ..init(path)
      ..registerAdapter(ImageCacheModelAdapter());
    imageCacheBox = await Hive.openBox(ImageCacheModel.hiveKey);
  }
}
