//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_disease_symptom_command.g.dart';

/// CreateDiseaseSymptomCommand
///
/// Properties:
/// * [name]
abstract class CreateDiseaseSymptomCommand
    implements
        Built<CreateDiseaseSymptomCommand, CreateDiseaseSymptomCommandBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  CreateDiseaseSymptomCommand._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateDiseaseSymptomCommandBuilder b) => b;

  factory CreateDiseaseSymptomCommand(
          [void updates(CreateDiseaseSymptomCommandBuilder b)]) =
      _$CreateDiseaseSymptomCommand;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateDiseaseSymptomCommand> get serializer =>
      _$CreateDiseaseSymptomCommandSerializer();
}

class _$CreateDiseaseSymptomCommandSerializer
    implements StructuredSerializer<CreateDiseaseSymptomCommand> {
  @override
  final Iterable<Type> types = const [
    CreateDiseaseSymptomCommand,
    _$CreateDiseaseSymptomCommand
  ];

  @override
  final String wireName = r'CreateDiseaseSymptomCommand';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreateDiseaseSymptomCommand object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    result
      ..add(r'name')
      ..add(serializers.serialize(object.name,
          specifiedType: const FullType(String)));
    return result;
  }

  @override
  CreateDiseaseSymptomCommand deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CreateDiseaseSymptomCommandBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }
    return result.build();
  }
}
