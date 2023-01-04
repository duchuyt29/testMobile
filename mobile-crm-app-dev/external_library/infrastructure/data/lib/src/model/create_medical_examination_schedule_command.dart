//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_medical_examination_schedule_command.g.dart';

/// CreateMedicalExaminationScheduleCommand
///
/// Properties:
/// * [customerID]
/// * [customerName]
/// * [customerGender]
/// * [hospitalID]
/// * [hospitalName]
/// * [hospitalAddress]
/// * [department]
/// * [examinationDate]
/// * [diseaseSymptoms]
abstract class CreateMedicalExaminationScheduleCommand
    implements
        Built<CreateMedicalExaminationScheduleCommand,
            CreateMedicalExaminationScheduleCommandBuilder> {
  @BuiltValueField(wireName: r'customerID')
  String? get customerID;

  @BuiltValueField(wireName: r'customerName')
  String? get customerName;

  @BuiltValueField(wireName: r'customerGender')
  String? get customerGender;

  @BuiltValueField(wireName: r'hospitalID')
  String? get hospitalID;

  @BuiltValueField(wireName: r'hospitalName')
  String? get hospitalName;

  @BuiltValueField(wireName: r'hospitalAddress')
  String? get hospitalAddress;

  @BuiltValueField(wireName: r'department')
  String? get department;

  @BuiltValueField(wireName: r'examinationDate')
  DateTime? get examinationDate;

  @BuiltValueField(wireName: r'diseaseSymptoms')
  BuiltList<String>? get diseaseSymptoms;

  CreateMedicalExaminationScheduleCommand._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateMedicalExaminationScheduleCommandBuilder b) => b;

  factory CreateMedicalExaminationScheduleCommand(
          [void updates(CreateMedicalExaminationScheduleCommandBuilder b)]) =
      _$CreateMedicalExaminationScheduleCommand;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateMedicalExaminationScheduleCommand> get serializer =>
      _$CreateMedicalExaminationScheduleCommandSerializer();
}

class _$CreateMedicalExaminationScheduleCommandSerializer
    implements StructuredSerializer<CreateMedicalExaminationScheduleCommand> {
  @override
  final Iterable<Type> types = const [
    CreateMedicalExaminationScheduleCommand,
    _$CreateMedicalExaminationScheduleCommand
  ];

  @override
  final String wireName = r'CreateMedicalExaminationScheduleCommand';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreateMedicalExaminationScheduleCommand object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.customerID != null) {
      result
        ..add(r'customerID')
        ..add(serializers.serialize(object.customerID,
            specifiedType: const FullType(String)));
    }
    if (object.customerName != null) {
      result
        ..add(r'customerName')
        ..add(serializers.serialize(object.customerName,
            specifiedType: const FullType(String)));
    }
    if (object.customerGender != null) {
      result
        ..add(r'customerGender')
        ..add(serializers.serialize(object.customerGender,
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
    if (object.hospitalAddress != null) {
      result
        ..add(r'hospitalAddress')
        ..add(serializers.serialize(object.hospitalAddress,
            specifiedType: const FullType(String)));
    }
    if (object.department != null) {
      result
        ..add(r'department')
        ..add(serializers.serialize(object.department,
            specifiedType: const FullType(String)));
    }
    if (object.examinationDate != null) {
      result
        ..add(r'examinationDate')
        ..add(serializers.serialize(object.examinationDate,
            specifiedType: const FullType(DateTime)));
    }
    if (object.diseaseSymptoms != null) {
      result
        ..add(r'diseaseSymptoms')
        ..add(serializers.serialize(object.diseaseSymptoms,
            specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  CreateMedicalExaminationScheduleCommand deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CreateMedicalExaminationScheduleCommandBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'customerID':
          result.customerID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'customerName':
          result.customerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'customerGender':
          result.customerGender = serializers.deserialize(value,
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
        case r'hospitalAddress':
          result.hospitalAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'department':
          result.department = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'examinationDate':
          result.examinationDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case r'diseaseSymptoms':
          result.diseaseSymptoms.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(String)]))
              as BuiltList<String>);
          break;
      }
    }
    return result.build();
  }
}
