// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_disease_symptom_command.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateDiseaseSymptomCommand extends CreateDiseaseSymptomCommand {
  @override
  final String name;

  factory _$CreateDiseaseSymptomCommand(
          [void Function(CreateDiseaseSymptomCommandBuilder)? updates]) =>
      (new CreateDiseaseSymptomCommandBuilder()..update(updates)).build();

  _$CreateDiseaseSymptomCommand._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, 'CreateDiseaseSymptomCommand', 'name');
  }

  @override
  CreateDiseaseSymptomCommand rebuild(
          void Function(CreateDiseaseSymptomCommandBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateDiseaseSymptomCommandBuilder toBuilder() =>
      new CreateDiseaseSymptomCommandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateDiseaseSymptomCommand && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateDiseaseSymptomCommand')
          ..add('name', name))
        .toString();
  }
}

class CreateDiseaseSymptomCommandBuilder
    implements
        Builder<CreateDiseaseSymptomCommand,
            CreateDiseaseSymptomCommandBuilder> {
  _$CreateDiseaseSymptomCommand? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CreateDiseaseSymptomCommandBuilder() {
    CreateDiseaseSymptomCommand._defaults(this);
  }

  CreateDiseaseSymptomCommandBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateDiseaseSymptomCommand other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateDiseaseSymptomCommand;
  }

  @override
  void update(void Function(CreateDiseaseSymptomCommandBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateDiseaseSymptomCommand build() {
    final _$result = _$v ??
        new _$CreateDiseaseSymptomCommand._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'CreateDiseaseSymptomCommand', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
