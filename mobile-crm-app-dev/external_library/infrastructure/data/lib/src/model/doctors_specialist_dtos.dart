//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctors_specialist_dtos.g.dart';

/// DoctorsSpecialistDtos
///
/// Properties:
/// * [id]
/// * [name]
abstract class DoctorsSpecialistDtos
    implements Built<DoctorsSpecialistDtos, DoctorsSpecialistDtosBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  DoctorsSpecialistDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorsSpecialistDtosBuilder b) => b;

  factory DoctorsSpecialistDtos(
      [void updates(DoctorsSpecialistDtosBuilder b)]) = _$DoctorsSpecialistDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorsSpecialistDtos> get serializer =>
      _$DoctorsSpecialistDtosSerializer();
}

class _$DoctorsSpecialistDtosSerializer
    implements StructuredSerializer<DoctorsSpecialistDtos> {
  @override
  final Iterable<Type> types = const [
    DoctorsSpecialistDtos,
    _$DoctorsSpecialistDtos
  ];

  @override
  final String wireName = r'DoctorsSpecialistDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DoctorsSpecialistDtos object,
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
    return result;
  }

  @override
  DoctorsSpecialistDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorsSpecialistDtosBuilder();

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
      }
    }
    return result.build();
  }
}
