//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hospital_service_dtos.g.dart';

/// HospitalServiceDtos
///
/// Properties:
/// * [id]
/// * [name]
/// * [forceColor]
/// * [backgroundColor]
abstract class HospitalServiceDtos
    implements Built<HospitalServiceDtos, HospitalServiceDtosBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'forceColor')
  String? get forceColor;

  @BuiltValueField(wireName: r'backgroundColor')
  String? get backgroundColor;

  HospitalServiceDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HospitalServiceDtosBuilder b) => b;

  factory HospitalServiceDtos([void updates(HospitalServiceDtosBuilder b)]) =
      _$HospitalServiceDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<HospitalServiceDtos> get serializer =>
      _$HospitalServiceDtosSerializer();
}

class _$HospitalServiceDtosSerializer
    implements StructuredSerializer<HospitalServiceDtos> {
  @override
  final Iterable<Type> types = const [
    HospitalServiceDtos,
    _$HospitalServiceDtos
  ];

  @override
  final String wireName = r'HospitalServiceDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HospitalServiceDtos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.id != null) {
      result
        ..add(r'id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add(r'name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.forceColor != null) {
      result
        ..add(r'forceColor')
        ..add(serializers.serialize(object.forceColor,
            specifiedType: const FullType(String)));
    }
    if (object.backgroundColor != null) {
      result
        ..add(r'backgroundColor')
        ..add(serializers.serialize(object.backgroundColor,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HospitalServiceDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HospitalServiceDtosBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'forceColor':
          result.forceColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'backgroundColor':
          result.backgroundColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }
    return result.build();
  }
}
