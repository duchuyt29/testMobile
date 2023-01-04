import 'package:hive/hive.dart';

import '../hive_dao.dart';
import '../models/image_cache_model.dart';

class ImageCacheDAO extends HiveDAO<ImageCacheModel> {
  final Box<ImageCacheModel> _box;

  ImageCacheDAO(this._box);

  @override
  void add(ImageCacheModel object) {
    _box.put(object.url, object);
  }

  @override
  String get boxName => ImageCacheModel.hiveKey;

  @override
  void delete(ImageCacheModel object) {
    _box.delete(object);
  }

  @override
  List<ImageCacheModel> getAll() {
    return _box.values.toList();
  }

  @override
  Box<ImageCacheModel> get getBox => _box;

  ImageCacheModel? getByUrl(String url) {
    return _box.get(url);
  }
}
