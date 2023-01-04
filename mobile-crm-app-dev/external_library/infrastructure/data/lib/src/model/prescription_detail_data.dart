//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prescription_detail_data.g.dart';

/// PrescriptionDetailData
///
/// Properties:
/// * [id]
/// * [drugName]
/// * [quantity]
/// * [unit]
/// * [unitPrice]
/// * [taxPercent]
/// * [totalTax]
/// * [totalNoTax]
/// * [totalWithTax]
abstract class PrescriptionDetailData
    implements Built<PrescriptionDetailData, PrescriptionDetailDataBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'drugName')
  String? get drugName;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  @BuiltValueField(wireName: r'unitPrice')
  double? get unitPrice;

  @BuiltValueField(wireName: r'taxPercent')
  double? get taxPercent;

  @BuiltValueField(wireName: r'totalTax')
  double? get totalTax;

  @BuiltValueField(wireName: r'totalNoTax')
  double? get totalNoTax;

  @BuiltValueField(wireName: r'totalWithTax')
  double? get totalWithTax;

  PrescriptionDetailData._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrescriptionDetailDataBuilder b) => b;

  factory PrescriptionDetailData(
          [void updates(PrescriptionDetailDataBuilder b)]) =
      _$PrescriptionDetailData;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrescriptionDetailData> get serializer =>
      _$PrescriptionDetailDataSerializer();
}

class _$PrescriptionDetailDataSerializer
    implements StructuredSerializer<PrescriptionDetailData> {
  @override
  final Iterable<Type> types = const [
    PrescriptionDetailData,
    _$PrescriptionDetailData
  ];

  @override
  final String wireName = r'PrescriptionDetailData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PrescriptionDetailData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.id != null) {
      result
        ..add(r'id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.drugName != null) {
      result
        ..add(r'drugName')
        ..add(serializers.serialize(object.drugName,
            specifiedType: const FullType(String)));
    }
    if (object.quantity != null) {
      result
        ..add(r'quantity')
        ..add(serializers.serialize(object.quantity,
            specifiedType: const FullType(double)));
    }
    if (object.unit != null) {
      result
        ..add(r'unit')
        ..add(serializers.serialize(object.unit,
            specifiedType: const FullType(String)));
    }
    if (object.unitPrice != null) {
      result
        ..add(r'unitPrice')
        ..add(serializers.serialize(object.unitPrice,
            specifiedType: const FullType(double)));
    }
    if (object.taxPercent != null) {
      result
        ..add(r'taxPercent')
        ..add(serializers.serialize(object.taxPercent,
            specifiedType: const FullType(double)));
    }
    if (object.totalTax != null) {
      result
        ..add(r'totalTax')
        ..add(serializers.serialize(object.totalTax,
            specifiedType: const FullType(double)));
    }
    if (object.totalNoTax != null) {
      result
        ..add(r'totalNoTax')
        ..add(serializers.serialize(object.totalNoTax,
            specifiedType: const FullType(double)));
    }
    if (object.totalWithTax != null) {
      result
        ..add(r'totalWithTax')
        ..add(serializers.serialize(object.totalWithTax,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PrescriptionDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PrescriptionDetailDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case r'drugName':
          result.drugName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case r'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'unitPrice':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case r'taxPercent':
          result.taxPercent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case r'totalTax':
          result.totalTax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case r'totalNoTax':
          result.totalNoTax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case r'totalWithTax':
          result.totalWithTax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }
    return result.build();
  }
}
