// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_symptom_summary_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DiseaseSymptomSummaryDtos extends DiseaseSymptomSummaryDtos {
  @override
  final String? code;
  @override
  final String? name;

  factory _$DiseaseSymptomSummaryDtos(
          [void Function(DiseaseSymptomSummaryDtosBuilder)? updates]) =>
      (new DiseaseSymptomSummaryDtosBuilder()..update(updates)).build();

  _$DiseaseSymptomSummaryDtos._({this.code, this.name}) : super._();

  @override
  DiseaseSymptomSummaryDtos rebuild(
          void Function(DiseaseSymptomSummaryDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiseaseSymptomSummaryDtosBuilder toBuilder() =>
      new DiseaseSymptomSummaryDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiseaseSymptomSummaryDtos &&
        code == other.code &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, code.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiseaseSymptomSummaryDtos')
          ..add('code', code)
          ..add('name', name))
        .toString();
  }
}

class DiseaseSymptomSummaryDtosBuilder
    implements
        Builder<DiseaseSymptomSummaryDtos, DiseaseSymptomSummaryDtosBuilder> {
  _$DiseaseSymptomSummaryDtos? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DiseaseSymptomSummaryDtosBuilder() {
    DiseaseSymptomSummaryDtos._defaults(this);
  }

  DiseaseSymptomSummaryDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiseaseSymptomSummaryDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiseaseSymptomSummaryDtos;
  }

  @override
  void update(void Function(DiseaseSymptomSummaryDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiseaseSymptomSummaryDtos build() {
    final _$result =
        _$v ?? new _$DiseaseSymptomSummaryDtos._(code: code, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
