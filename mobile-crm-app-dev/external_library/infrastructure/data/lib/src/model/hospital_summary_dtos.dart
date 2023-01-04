//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:data_infrastructure/src/model/hospital_service_dtos.dart';
import 'package:built_collection/built_collection.dart';
import 'package:data_infrastructure/src/model/hospital_calendar_dtos.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hospital_summary_dtos.g.dart';

/// HospitalSummaryDtos
///
/// Properties:
/// * [id]
/// * [name]
/// * [description]
/// * [image]
/// * [address]
/// * [website]
/// * [phone]
/// * [lat]
/// * [long]
/// * [calendars]
/// * [services]
abstract class HospitalSummaryDtos
    implements Built<HospitalSummaryDtos, HospitalSummaryDtosBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'image')
  String? get image;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'website')
  String? get website;

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'lat')
  String? get lat;

  @BuiltValueField(wireName: r'long')
  String? get long;

  @BuiltValueField(wireName: r'calendars')
  BuiltList<HospitalCalendarDtos>? get calendars;

  @BuiltValueField(wireName: r'services')
  BuiltList<HospitalServiceDtos>? get services;

  HospitalSummaryDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HospitalSummaryDtosBuilder b) => b;

  factory HospitalSummaryDtos([void updates(HospitalSummaryDtosBuilder b)]) =
      _$HospitalSummaryDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<HospitalSummaryDtos> get serializer =>
      _$HospitalSummaryDtosSerializer();
}

class _$HospitalSummaryDtosSerializer
    implements StructuredSerializer<HospitalSummaryDtos> {
  @override
  final Iterable<Type> types = const [
    HospitalSummaryDtos,
    _$HospitalSummaryDtos
  ];

  @override
  final String wireName = r'HospitalSummaryDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HospitalSummaryDtos object,
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
    if (object.description != null) {
      result
        ..add(r'description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.image != null) {
      result
        ..add(r'image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add(r'address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.website != null) {
      result
        ..add(r'website')
        ..add(serializers.serialize(object.website,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add(r'phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.lat != null) {
      result
        ..add(r'lat')
        ..add(serializers.serialize(object.lat,
            specifiedType: const FullType(String)));
    }
    if (object.long != null) {
      result
        ..add(r'long')
        ..add(serializers.serialize(object.long,
            specifiedType: const FullType(String)));
    }
    if (object.calendars != null) {
      result
        ..add(r'calendars')
        ..add(serializers.serialize(object.calendars,
            specifiedType:
                const FullType(BuiltList, [FullType(HospitalCalendarDtos)])));
    }
    if (object.services != null) {
      result
        ..add(r'services')
        ..add(serializers.serialize(object.services,
            specifiedType:
                const FullType(BuiltList, [FullType(HospitalServiceDtos)])));
    }
    return result;
  }

  @override
  HospitalSummaryDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HospitalSummaryDtosBuilder();

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
        case r'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'long':
          result.long = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'calendars':
          result.calendars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, [FullType(HospitalCalendarDtos)]))
              as BuiltList<HospitalCalendarDtos>);
          break;
        case r'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, [FullType(HospitalServiceDtos)]))
              as BuiltList<HospitalServiceDtos>);
          break;
      }
    }
    return result.build();
  }
}
