//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'disease_symptom_summary_dtos.g.dart';

/// DiseaseSymptomSummaryDtos
///
/// Properties:
/// * [code]
/// * [name]
abstract class DiseaseSymptomSummaryDtos
    implements
        Built<DiseaseSymptomSummaryDtos, DiseaseSymptomSummaryDtosBuilder> {
  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'name')
  String? get name;

  DiseaseSymptomSummaryDtos._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DiseaseSymptomSummaryDtosBuilder b) => b;

  factory DiseaseSymptomSummaryDtos(
          [void updates(DiseaseSymptomSummaryDtosBuilder b)]) =
      _$DiseaseSymptomSummaryDtos;

  @BuiltValueSerializer(custom: true)
  static Serializer<DiseaseSymptomSummaryDtos> get serializer =>
      _$DiseaseSymptomSummaryDtosSerializer();
}

class _$DiseaseSymptomSummaryDtosSerializer
    implements StructuredSerializer<DiseaseSymptomSummaryDtos> {
  @override
  final Iterable<Type> types = const [
    DiseaseSymptomSummaryDtos,
    _$DiseaseSymptomSummaryDtos
  ];

  @override
  final String wireName = r'DiseaseSymptomSummaryDtos';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DiseaseSymptomSummaryDtos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.code != null) {
      result
        ..add(r'code')
        ..add(serializers.serialize(object.code,
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
  DiseaseSymptomSummaryDtos deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DiseaseSymptomSummaryDtosBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'code':
          result.code = serializers.deserialize(value,
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
