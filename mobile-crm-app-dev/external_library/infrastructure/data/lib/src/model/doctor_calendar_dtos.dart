//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_calendar_dtos.g.dart';

/// DoctorCalendarDtos
///
/// Properties:
/// * [day]
/// * [isAvailable]
/// * [shift]
/// * [startTime]
/// * [endTime]
abstract class DoctorCalendarDtos
    implements Built<DoctorCalendarDtos, DoctorCalendarDtosBuilder> {
  @BuiltValueField(wireName: r'day')
  String? get day;

  @BuiltValueField(wireName: r'isAvailable')
  bool? get isAvailable;

  @BuiltValueField(wireName: r'shift')
  String? get shift;

  @BuiltValueField(wireName: r'startTime')
  String? get startTime;

  @BuiltValueField(wireName: r'endTime')
  String? get endTime;

  DoctorCalendarDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorCalendarDtosBuilder b) => b;

  factory DoctorCalendarDtos([void updates(DoctorCalendarDtosBuilder b)]) =
      _$DoctorCalendarDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorCalendarDtos> get serializer =>
      _$DoctorCalendarDtosSerializer();
}

class _$DoctorCalendarDtosSerializer
    implements StructuredSerializer<DoctorCalendarDtos> {
  @override
  final Iterable<Type> types = const [DoctorCalendarDtos, _$DoctorCalendarDtos];

  @override
  final String wireName = r'DoctorCalendarDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DoctorCalendarDtos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.day != null) {
      result
        ..add(r'day')
        ..add(serializers.serialize(object.day,
            specifiedType: const FullType(String)));
    }
    if (object.isAvailable != null) {
      result
        ..add(r'isAvailable')
        ..add(serializers.serialize(object.isAvailable,
            specifiedType: const FullType(bool)));
    }
    if (object.shift != null) {
      result
        ..add(r'shift')
        ..add(serializers.serialize(object.shift,
            specifiedType: const FullType(String)));
    }
    if (object.startTime != null) {
      result
        ..add(r'startTime')
        ..add(serializers.serialize(object.startTime,
            specifiedType: const FullType(String)));
    }
    if (object.endTime != null) {
      result
        ..add(r'endTime')
        ..add(serializers.serialize(object.endTime,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DoctorCalendarDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorCalendarDtosBuilder();

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
        case r'isAvailable':
          result.isAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case r'shift':
          result.shift = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'endTime':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }
    return result.build();
  }
}
