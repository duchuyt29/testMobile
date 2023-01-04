import 'package:hive/hive.dart';

part 'image_cache_model.g.dart';

@HiveType(typeId: 1)
class ImageCacheModel extends HiveObject {
  static const hiveKey = 'IMAGE_CACHE_HIVE_KEY';

  @HiveField(0)
  final String url;
  @HiveField(1)
  final String filePath;
  ImageCacheModel({
    required this.filePath,
    required this.url,
  });
}
