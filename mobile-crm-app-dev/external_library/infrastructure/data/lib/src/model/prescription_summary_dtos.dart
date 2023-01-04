//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prescription_summary_dtos.g.dart';

/// PrescriptionSummaryDtos
///
/// Properties:
/// * [id]
/// * [customerID]
/// * [createdDate]
/// * [hospitalID]
/// * [hospitalName]
/// * [hospitalAddress]
/// * [doctorID]
/// * [doctorName]
/// * [amount]
/// * [medicalExaminationScheduleID]
abstract class PrescriptionSummaryDtos
    implements Built<PrescriptionSummaryDtos, PrescriptionSummaryDtosBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'customerID')
  String? get customerID;

  @BuiltValueField(wireName: r'createdDate')
  DateTime? get createdDate;

  @BuiltValueField(wireName: r'hospitalID')
  String? get hospitalID;

  @BuiltValueField(wireName: r'hospitalName')
  String? get hospitalName;

  @BuiltValueField(wireName: r'hospitalAddress')
  String? get hospitalAddress;

  @BuiltValueField(wireName: r'doctorID')
  String? get doctorID;

  @BuiltValueField(wireName: r'doctorName')
  String? get doctorName;

  @BuiltValueField(wireName: r'amount')
  double? get amount;

  @BuiltValueField(wireName: r'medicalExaminationScheduleID')
  int? get medicalExaminationScheduleID;

  PrescriptionSummaryDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrescriptionSummaryDtosBuilder b) => b;

  factory PrescriptionSummaryDtos(
          [void updates(PrescriptionSummaryDtosBuilder b)]) =
      _$PrescriptionSummaryDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrescriptionSummaryDtos> get serializer =>
      _$PrescriptionSummaryDtosSerializer();
}

class _$PrescriptionSummaryDtosSerializer
    implements StructuredSerializer<PrescriptionSummaryDtos> {
  @override
  final Iterable<Type> types = const [
    PrescriptionSummaryDtos,
    _$PrescriptionSummaryDtos
  ];

  @override
  final String wireName = r'PrescriptionSummaryDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PrescriptionSummaryDtos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.id != null) {
      result
        ..add(r'id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.customerID != null) {
      result
        ..add(r'customerID')
        ..add(serializers.serialize(object.customerID,
            specifiedType: const FullType(String)));
    }
    if (object.createdDate != null) {
      result
        ..add(r'createdDate')
        ..add(serializers.serialize(object.createdDate,
            specifiedType: const FullType(DateTime)));
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
    if (object.hospitalAddress != null) {
      result
        ..add(r'hospitalAddress')
        ..add(serializers.serialize(object.hospitalAddress,
            specifiedType: const FullType(String)));
    }
    if (object.doctorID != null) {
      result
        ..add(r'doctorID')
        ..add(serializers.serialize(object.doctorID,
            specifiedType: const FullType(String)));
    }
    if (object.doctorName != null) {
      result
        ..add(r'doctorName')
        ..add(serializers.serialize(object.doctorName,
            specifiedType: const FullType(String)));
    }
    if (object.amount != null) {
      result
        ..add(r'amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(double)));
    }
    if (object.medicalExaminationScheduleID != null) {
      result
        ..add(r'medicalExaminationScheduleID')
        ..add(serializers.serialize(object.medicalExaminationScheduleID,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PrescriptionSummaryDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PrescriptionSummaryDtosBuilder();

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
        case r'customerID':
          result.customerID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case r'hospitalID':
          result.hospitalID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'hospitalName':
          result.hospitalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'hospitalAddress':
          result.hospitalAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'doctorID':
          result.doctorID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'doctorName':
          result.doctorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case r'medicalExaminationScheduleID':
          result.medicalExaminationScheduleID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }
    return result.build();
  }
}
