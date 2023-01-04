//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hospital_calendar_dtos.g.dart';

/// HospitalCalendarDtos
///
/// Properties:
/// * [day]
/// * [isOpen]
/// * [shift]
/// * [openTime]
/// * [closeTime]
abstract class HospitalCalendarDtos
    implements Built<HospitalCalendarDtos, HospitalCalendarDtosBuilder> {
  @BuiltValueField(wireName: r'day')
  String? get day;

  @BuiltValueField(wireName: r'isOpen')
  bool? get isOpen;

  @BuiltValueField(wireName: r'shift')
  String? get shift;

  @BuiltValueField(wireName: r'openTime')
  String? get openTime;

  @BuiltValueField(wireName: r'closeTime')
  String? get closeTime;

  HospitalCalendarDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HospitalCalendarDtosBuilder b) => b;

  factory HospitalCalendarDtos([void updates(HospitalCalendarDtosBuilder b)]) =
      _$HospitalCalendarDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<HospitalCalendarDtos> get serializer =>
      _$HospitalCalendarDtosSerializer();
}

class _$HospitalCalendarDtosSerializer
    implements StructuredSerializer<HospitalCalendarDtos> {
  @override
  final Iterable<Type> types = const [
    HospitalCalendarDtos,
    _$HospitalCalendarDtos
  ];

  @override
  final String wireName = r'HospitalCalendarDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HospitalCalendarDtos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.day != null) {
      result
        ..add(r'day')
        ..add(serializers.serialize(object.day,
            specifiedType: const FullType(String)));
    }
    if (object.isOpen != null) {
      result
        ..add(r'isOpen')
        ..add(serializers.serialize(object.isOpen,
            specifiedType: const FullType(bool)));
    }
    if (object.shift != null) {
      result
        ..add(r'shift')
        ..add(serializers.serialize(object.shift,
            specifiedType: const FullType(String)));
    }
    if (object.openTime != null) {
      result
        ..add(r'openTime')
        ..add(serializers.serialize(object.openTime,
            specifiedType: const FullType(String)));
    }
    if (object.closeTime != null) {
      result
        ..add(r'closeTime')
        ..add(serializers.serialize(object.closeTime,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HospitalCalendarDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HospitalCalendarDtosBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'isOpen':
          result.isOpen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case r'shift':
          result.shift = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'openTime':
          result.openTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'closeTime':
          result.closeTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }
    return result.build();
  }
}
