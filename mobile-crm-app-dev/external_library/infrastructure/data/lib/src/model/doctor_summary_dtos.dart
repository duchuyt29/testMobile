//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:data_infrastructure/src/model/doctor_calendar_dtos.dart';
import 'package:data_infrastructure/src/model/doctors_specialist_dtos.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_summary_dtos.g.dart';

/// DoctorSummaryDtos
///
/// Properties:
/// * [id]
/// * [hospitalID]
/// * [hospitalName]
/// * [fullName]
/// * [phone]
/// * [age]
/// * [image]
/// * [specialists]
/// * [calendars]
abstract class DoctorSummaryDtos
    implements Built<DoctorSummaryDtos, DoctorSummaryDtosBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'hospitalID')
  String? get hospitalID;

  @BuiltValueField(wireName: r'hospitalName')
  String? get hospitalName;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'age')
  String? get age;

  @BuiltValueField(wireName: r'image')
  String? get image;

  @BuiltValueField(wireName: r'specialists')
  BuiltList<DoctorsSpecialistDtos>? get specialists;

  @BuiltValueField(wireName: r'calendars')
  BuiltList<DoctorCalendarDtos>? get calendars;

  DoctorSummaryDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorSummaryDtosBuilder b) => b;

  factory DoctorSummaryDtos([void updates(DoctorSummaryDtosBuilder b)]) =
      _$DoctorSummaryDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorSummaryDtos> get serializer =>
      _$DoctorSummaryDtosSerializer();
}

class _$DoctorSummaryDtosSerializer
    implements StructuredSerializer<DoctorSummaryDtos> {
  @override
  final Iterable<Type> types = const [DoctorSummaryDtos, _$DoctorSummaryDtos];

  @override
  final String wireName = r'DoctorSummaryDtos';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorSummaryDtos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.id != null) {
      result
        ..add(r'id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.hospitalID != null) {
      result
        ..add(r'hospitalID')
        ..add(serializers.serialize(object.hospitalID,
            specifiedType: const FullType(String)));
    }
    if (object.hospitalName != null) {
      result
        ..add(r'hospitalName')
        ..add(serializers.serialize(object.hospitalName,
            specifiedType: const FullType(String)));
    }
    if (object.fullName != null) {
      result
        ..add(r'fullName')
        ..add(serializers.serialize(object.fullName,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add(r'phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.age != null) {
      result
        ..add(r'age')
        ..add(serializers.serialize(object.age,
            specifiedType: const FullType(String)));
    }
    if (object.image != null) {
      result
        ..add(r'image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }
    if (object.specialists != null) {
      result
        ..add(r'specialists')
        ..add(serializers.serialize(object.specialists,
            specifiedType:
                const FullType(BuiltList, [FullType(DoctorsSpecialistDtos)])));
    }
    if (object.calendars != null) {
      result
        ..add(r'calendars')
        ..add(serializers.serialize(object.calendars,
            specifiedType:
                const FullType(BuiltList, [FullType(DoctorCalendarDtos)])));
    }
    return result;
  }

  @override
  DoctorSummaryDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorSummaryDtosBuilder();

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
        case r'hospitalID':
          result.hospitalID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'hospitalName':
          result.hospitalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'specialists':
          result.specialists.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, [FullType(DoctorsSpecialistDtos)]))
              as BuiltList<DoctorsSpecialistDtos>);
          break;
        case r'calendars':
          result.calendars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, [FullType(DoctorCalendarDtos)]))
              as BuiltList<DoctorCalendarDtos>);
          break;
      }
    }
    return result.build();
  }
}
