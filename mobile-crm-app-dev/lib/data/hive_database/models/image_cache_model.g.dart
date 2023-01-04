// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageCacheModelAdapter extends TypeAdapter<ImageCacheModel> {
  @override
  final int typeId = 1;

  @override
  ImageCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageCacheModel(
      filePath: fields[1] as String,
      url: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageCacheModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.filePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
