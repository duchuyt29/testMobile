import 'package:hive/hive.dart';

abstract class HiveDAO<T> {
  String get boxName;
  Box<T> get getBox;
  void add(T object);
  void delete(T object);
  List<T> getAll();
}
